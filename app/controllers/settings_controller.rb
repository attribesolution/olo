class SettingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end

  def upload_images
    begin
      unless params[:user].nil?
        unless params[:user][:logo].nil?
          uploader = LogoUploader.new
          uploader.store!(params[:user][:logo])
          current_user.logo = params[:user][:logo]
          current_user.save!
        end

        unless params[:user][:background_image].nil?
          uploader = BackgroundImageUploader.new
          uploader.store!(params[:user][:background_image])
          current_user.background_image = params[:user][:background_image]
          current_user.save!
        end
      end
    rescue Exception => e
      flash[:alert] = e.message
    end

    redirect_to root_path
  end

  def sync
    begin
      response = HTTParty.get(Rails.application.secrets.dmenu_domain_address + '/api/v1/user/get_api_key?passcode=' + params[:passcode])
      if response["api_key"].present?
        sync_response = HTTParty.get(Rails.application.secrets.dmenu_domain_address + '/api/v1/categories/sync', headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 'Authorization' => response["api_key"] })
        import_dmenu_data(sync_response)
      end
      flash[:notice] = "Your DMenu account data has been synced successfully."
    rescue Exception => e
      flash[:alert] = e.message
    end
    redirect_to root_path
  end

  def import_dmenu_data(sync_response)
    Category.where(restaurant_owner_id: current_user.id).destroy_all # this will destroy all categories and its dependencies
    sync_response.each do |category|
      new_category = Category.create(name: category["name"], image: category["image"], uuid: category["uuid"], restaurant_owner_id: current_user.id)
      
      category["menus"].each do |menu|
        new_menu = Menu.create(name: menu["name"], price: menu["price"], description: menu["description"], uuid: menu["uuid"], category_id: new_category.id, approved: menu["approved"], restaurant_owner_id: current_user.id)
        
        menu["images"].each do |menu_image|
          new_menu_image = MenuImage.create(image: menu_image["url"], menu_id: new_menu.id)
        end
      end
    end
  end

end
