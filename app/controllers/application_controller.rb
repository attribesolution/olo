class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_api_request
    api_key = request.headers["HTTP_AUTHORIZATION"]
    @user = User.where(api_key: api_key).first
  
    render :json => { :status => 401, message: "Invalid api key." } if @user.nil?
  end
end
