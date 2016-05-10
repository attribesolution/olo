class Api::V1::MenusController < ApiController
  # before_action :verify_category, only: [:index]

  def index
    @menus = Menu.by_category_id(params[:category_id]).is_active.order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def by_restaurant_owner
    @menus = Menu.by_restaurant_owner(@user.id).is_active.order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

  private
    def verify_category
      unless @user.categories.map{|c| c.id}.include? params[:category_id].to_i
        render :json => { :status => 401, message: "Invalid category id." }
      end
    end
end
