class DeviceTableMappingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device_table_mapping, only: [:show, :edit, :update, :destroy]

  # GET /device_table_mappings
  # GET /device_table_mappings.json
  def index
    @device_table_mappings = DeviceTableMapping.by_restaurant_owner(current_user.id).order('created_at DESC')
  end

  # GET /device_table_mappings/1
  # GET /device_table_mappings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_table_mapping
      @device_table_mapping = DeviceTableMapping.find(params[:id])
    end
end
