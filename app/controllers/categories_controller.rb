class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.by_restaurant_owner(current_user.id).order(sort_order: :asc)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  def category_sorting
    sorted_ids = params[:sorted_ids]
    sorted_ids.each_with_index do |sorted_id, index|
      category = Category.find_by_id(sorted_id)
      if category.nil?
        return render :json => { message: "Category not found", :status => 404 }
      else
        category.sort_order = index + 1
        category.save
      end
    end
    return render :json => { message: "Success.", :status => 200 }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
