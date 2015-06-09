class Api::V1::DevicesController < ApiController
  before_action :check_required_params, :validates_uniqueness

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

  def validates_uniqueness
    @device_id = params[:device_id]
    @device_name = params[:device_name]

    conflicted_device_id = DeviceTableMapping.where(device_id: @device_id)
    return render :json => { message: "Device ID already exists.", :status => 422 } if conflicted_device_id.any?

    conflicted_device_name_of_this_restaurant_owner = DeviceTableMapping.where("lower(device_name) = ? and restaurant_owner_id= ?", @device_name.downcase, @user.id)
    return render :json => { message: "Device Name already exists.", :status => 422 } if conflicted_device_name_of_this_restaurant_owner.any?
  end

end
