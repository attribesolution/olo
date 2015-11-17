class Api::V1::DevicesController < ApiController
  before_action :check_required_params, :validates_uniqueness, only: [:create]
  skip_before_action :authenticate_api_request

  def create
    device = DeviceTableMapping.new(device_id: @device_id, device_name: @device_name, restaurant_owner_id: @user.id)
    begin
      device.save!
      render :json => { message: "Device mapped successfully.", key: @user.api_key, :status => 200 }
    rescue => e
      render :json => { message: e.message, key: "", :status => 501 }
    end
  end

  def updated
    
    @device = DeviceTableMapping.where(device_id: params[:device_id])
      if @device.any?
        @device.first.updated = true
        check_dirty
        return render :json => { message: "Device mapped successfully.", :status => 200 }
      else

       return render :json => { message: "Device Name is required.", :status => 423 }
      end
  end

  def check_dirty
    restaurant_id = @device.first.restaurant_owner_id
    menus = Menu.where(restaurant_owner_id: restaurant_id)
    menus.each do |menu|
      menu.dirty == false 
    end


  end

  def check_required_params
    @device_id = params[:device_id]
    @device_name = params[:device_name]
    @passcode = params[:passcode]

    return render :json => { message: "Passcode is required.", :status => 421 } if @passcode.blank?
    return render :json => { message: "Device ID is required.", :status => 422 } if @device_id.blank?
    return render :json => { message: "Device Name is required.", :status => 423 } if @device_name.blank?
  end

  def validates_uniqueness
    @device_id = params[:device_id]
    @device_name = params[:device_name]
    @passcode = params[:passcode]

    @user = User.where(passcode: @passcode).first
    return render :json => { message: "Invalid Passcode", :status => 421 } if @user.nil? 

    conflicted_device_id = DeviceTableMapping.where(device_id: @device_id, restaurant_owner_id: @user.id)
    return render :json => { message: "Device ID already exists.", :status => 422 } if conflicted_device_id.any?

    conflicted_device_name_of_this_restaurant_owner = DeviceTableMapping.where("lower(device_name) = ? and restaurant_owner_id= ?", @device_name.downcase, @user.id)
    return render :json => { message: "Device Name already exists.", :status => 423 } if conflicted_device_name_of_this_restaurant_owner.any?
  end

end
