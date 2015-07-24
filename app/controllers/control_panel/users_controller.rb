class ControlPanel::UsersController < ApplicationController
  before_filter :authenticate_admin!
	
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

  protected

  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
