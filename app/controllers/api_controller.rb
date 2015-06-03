class ApiController < ApplicationController
  before_action :authenticate_api_request
	protect_from_forgery with: :null_session
 
	def authenticate_api_request
    api_key = request.headers["HTTP_AUTHORIZATION"]
    @user = User.where(api_key: api_key).first
  
    render :json => { :status => 401, message: "API key is required." } if api_key.blank?
    render :json => { :status => 401, message: "Invalid API key." } if @user.nil?
  end
end
