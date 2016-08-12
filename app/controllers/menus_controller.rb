class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @q = Menu.ransack(params[:q])
    @menus = @q.result.includes(:category).by_restaurant_owner(current_user.id).order(sort_order: :asc).page(params[:page])
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  def menu_sorting
    sorted_ids = params[:sorted_ids]
    sorted_ids.each_with_index do |sorted_id, index|
      menu = Menu.find_by_id(sorted_id)
      if menu.nil?
        error = {:status => 404, :message => "Menu not found"}
        render :json => error
      else
        menu.sort_order = index + 1
        menu.save
      end
      msg = { :status => 200, :message => "Success!" }
      render :json => msg
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
