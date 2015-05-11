class Api::V1::CategoriesController < ApplicationController
	before_action :authenticate_api_request

  def index
    @categories = Category.by_restaurant_owner(@user.id).order('created_at DESC')
  end

  private
    def authenticate_api_request
      api_key = request.headers["HTTP_AUTHORIZATION"]
      @user = User.where(api_key: api_key).first
    
      render :json => { :status => 401, message: "Invalid api key." } if @user.nil?
    end
end
