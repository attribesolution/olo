class Api::V1::MenusController < ApiController
  before_action :verify_category

  def index
    @menus = Menu.by_category_id(params[:category_id]).order('created_at DESC')
    @base_url = request.protocol + request.host_with_port
  end

  private
    def verify_category
      unless @user.categories.map{|c| c.id}.include? params[:category_id].to_i
        render :json => { :status => 401, message: "Invalid category id." }
      end
    end
end
