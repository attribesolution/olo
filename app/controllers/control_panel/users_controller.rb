class ControlPanel::UsersController < ApplicationController
  before_filter :authenticate_admin!
	
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.with_role(:restaurant_owner)
    end
  end

  def approve_disapprove
    user = User.find(params[:id])
    user.update_attribute(:approved, user.approved ^= true)
    
    msg = { :status => 200, :message => "Success!", :approved => user.approved ? "Yes" : "No" }
    render :json => msg
  end

  protected

  def authenticate_admin!
    redirect_to root_path unless current_user and current_user.has_role? :admin
  end
end
