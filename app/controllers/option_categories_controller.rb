class OptionCategoriesController < ApplicationController
  before_action :set_option_category, only: [:show, :edit, :update, :destroy]

  # GET /option_categories
  # GET /option_categories.json
  def index
    @option_categories = OptionCategory.all
  end

  # GET /option_categories/1
  # GET /option_categories/1.json
  def show
  end

  # GET /option_categories/new
  def new
    @option_category = OptionCategory.new
  end

  # GET /option_categories/1/edit
  def edit
  end

  # POST /option_categories
  # POST /option_categories.json
  def create
    @option_category = OptionCategory.new(option_category_params)
    @option_category.restaurant_owner_id = current_user.id

    respond_to do |format|
      if @option_category.save
        format.html { redirect_to @option_category, notice: 'Option category was successfully created.' }
        format.json { render :show, status: :created, location: @option_category }
      else
        format.html { render :new }
        format.json { render json: @option_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /option_categories/1
  # PATCH/PUT /option_categories/1.json
  def update
    respond_to do |format|
      if @option_category.update(option_category_params)
        format.html { redirect_to @option_category, notice: 'Option category was successfully updated.' }
        format.json { render :show, status: :ok, location: @option_category }
      else
        format.html { render :edit }
        format.json { render json: @option_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_categories/1
  # DELETE /option_categories/1.json
  def destroy
    @option_category.destroy
    respond_to do |format|
      format.html { redirect_to option_categories_url, notice: 'Option category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_category
      @option_category = OptionCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_category_params
      params.require(:option_category).permit(:name, :user_id, :multiple_choice, :required)
    end
end
