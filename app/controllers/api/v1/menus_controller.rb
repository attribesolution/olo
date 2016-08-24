class Api::V1::MenusController < ApiController
  before_action :verify_category, only: [:index]

  def index
    if params[:category_id]
      @menus = Menu.by_category_id(params[:category_id]).is_active.order('sort_order ASC')
    else
      @menus = Menu.is_active.order('created_at DESC')
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def by_restaurant_owner
    @menus = Menu.by_restaurant_owner(@user.id).is_active.order('created_at DESC')
  end

  private
    def verify_category
      if params[:category_id]
        unless @user.categories.map{|c| c.id}.include? params[:category_id].to_i
          render :json => { :status => 401, message: "Invalid category id." }
        end
      else
        return
      end
    end
end
