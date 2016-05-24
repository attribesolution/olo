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
      end
    rescue Exception => e
      flash[:alert] = e.message
    end
    redirect_to root_path
  end

end
