class SettingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end

  def upload_images
    binding.pry
  end

end
