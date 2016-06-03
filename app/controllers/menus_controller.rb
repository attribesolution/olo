class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @q = Menu.ransack(params[:q])
    @menus = @q.result.includes(:category).by_restaurant_owner(current_user.id).order(created_at: :desc).page(params[:page])
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
