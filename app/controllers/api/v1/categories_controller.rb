class Api::V1::CategoriesController < ApiController

  def index
    @categories = @user.categories.order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

  def sync
    @categories = @user.categories.order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

end
