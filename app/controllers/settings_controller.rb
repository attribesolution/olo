class SettingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end

  def upload_images
    unless params[:user].nil?
      binding.pry
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

    redirect_to root_path
  end

end
