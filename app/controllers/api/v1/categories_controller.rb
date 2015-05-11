class Api::V1::CategoriesController < ApplicationController
	before_action :authenticate_api_request

  def index
    @categories = @user.categories.order('created_at DESC')
  end

end
