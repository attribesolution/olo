class DeviceTableMappingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device_table_mapping, only: [:show, :edit, :update, :destroy]

  # GET /device_table_mappings
  # GET /device_table_mappings.json
  def index
    @device_table_mappings = DeviceTableMapping.by_restaurant_owner(current_user.id)
  end

  # GET /device_table_mappings/1
  # GET /device_table_mappings/1.json
  def show
  end

  # GET /device_table_mappings/new
  def new
    @device_table_mapping = DeviceTableMapping.new
  end

  # GET /device_table_mappings/1/edit
  def edit
  end

  # POST /device_table_mappings
  # POST /device_table_mappings.json
  def create
    @device_table_mapping = DeviceTableMapping.new(device_table_mapping_params)
    @device_table_mapping.restaurant_owner_id = current_user.id

    respond_to do |format|
      if @device_table_mapping.save
        format.html { redirect_to @device_table_mapping, notice: 'Device table mapping was successfully created.' }
        format.json { render :show, status: :created, location: @device_table_mapping }
      else
        format.html { render :new }
        format.json { render json: @device_table_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_table_mappings/1
  # PATCH/PUT /device_table_mappings/1.json
  def update
    respond_to do |format|
      if @device_table_mapping.update(device_table_mapping_params)
        format.html { redirect_to @device_table_mapping, notice: 'Device table mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_table_mapping }
      else
        format.html { render :edit }
        format.json { render json: @device_table_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_table_mappings/1
  # DELETE /device_table_mappings/1.json
  def destroy
    @device_table_mapping.destroy
    respond_to do |format|
      format.html { redirect_to device_table_mappings_url, notice: 'Device table mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_table_mapping
      @device_table_mapping = DeviceTableMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_table_mapping_params
      params.require(:device_table_mapping).permit(:device_id, :device_name, :table_number)
    end
end
