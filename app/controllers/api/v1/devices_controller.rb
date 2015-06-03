class Api::V1::DevicesController < ApiController
  before_action :check_required_params

  def create
    device = DeviceTableMapping.new(device_id: @device_id, device_name: @device_name, restaurant_owner_id: @user.id)
    begin
      device.save!
      render :json => { message: "Device mapped successfully.", :status => 200 }
    rescue => e
      render :json => { message: e.message, :status => 501 }
    end
  end

  def check_required_params
    @device_id = params[:device_id]
    @device_name = params[:device_name]

    return render :json => { message: "Device ID is required.", :status => 422 } if @device_id.blank?
    return render :json => { message: "Device Name is required.", :status => 422 } if @device_name.blank?
  end

end
