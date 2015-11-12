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

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    @menu.restaurant_owner_id = current_user.id

    # Upload menu images.
    upload_images

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path(:q => {:category_name_cont => @menu.category.name}), notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      binding.pry
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    # Upload menu images.
    upload_images
    
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menus_path(:q => {:category_name_cont => @menu.category.name}), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_path(:q => {:category_name_cont => @menu.category.name}), notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_images
    # Upload menu images.
    unless params[:menu][:menu_image].nil?
      params[:menu][:menu_image][:image].each do |p|
        @menu.menu_images.build(image: p)
      end
    end
  end

  def destroy_multiple
    if params[:menus_ids]  
      Menu.destroy(params[:menus_ids])
    end
    respond_to do |format|
      format.html { redirect_to menus_path }
      format.json { head :no_content }
    end
  end

  def approve_disapprove_menus
    menu = Menu.find(params[:id])
    menu.update_attribute(:approved, menu.approved ^= true)
    msg = { :status => 200, :message => "Success!", :approved => menu.approved ? "Yes" : "No" }
    render :json => msg
  end

   def add_dirty_menus
    menu = Menu.find(params[:id])
    menu.update_attribute(:dirty, menu.dirty ^= true)
    msg = { :status => 200, :message => "Success!", :dirty => menu.dirty ? "Yes" : "No" }
    render :json => msg
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :price, :description, :category_id, :dirty)
    end
end
