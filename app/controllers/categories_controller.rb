class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    if params[:q].present?
      @q = Category.ransack(params[:q])
      @categories = @q.result.includes(params[:name]).page(params[:page]).order(sort_order: :asc)
    else
      @categories = Category.by_restaurant_owner(current_user.id).order(sort_order: :asc)
      @q = Category.ransack(@category)
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
