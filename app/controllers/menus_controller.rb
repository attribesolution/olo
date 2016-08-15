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
    # binding.pry
    sorted_ids = params[:sorted_ids]
    sorted_ids.each_with_index do |sorted_id, index|
      menu = Menu.find_by_id(sorted_id)
      if menu.nil?
        return render :json => { message: "Menu not found", :status => 404 }
      else
        menu.sort_order = index + 1
        menu.save
      end
    end
    return render :json => { message: "Success.", :status => 200 }
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
