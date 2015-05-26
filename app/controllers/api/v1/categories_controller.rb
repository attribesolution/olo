class Api::V1::CategoriesController < ApiController
	before_action :authenticate_api_request

  def index
    @categories = @user.categories.order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

end
