class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @cat = Category.find_by_id(params[:category_id])
    if params[:q].present?
      @q = Menu.ransack(params[:q])
      @menus = @q.result.includes(:category).by_category_id(params[:category_id]).page(params[:page]).order(sort_order: :asc)
    else
      @menus = Menu.by_category_id(params[:category_id]).order(sort_order: :asc)
      @q = Menu.ransack(@cat.name)
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
