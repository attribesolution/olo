class Api::V1::CategoriesController < ApiController
  before_filter :check_required_params, :check_device, only: [:dirty]
  def index
    @categories = @user.categories.order('created_at DESC')
  end

  def sync
    @categories = @user.categories.order('created_at DESC')
  end

  def dirty
    if @device.first.updated == false
      @categories = @user.categories.order('created_at DESC')
    else
      return render :json => { message: "Device is already updated.", :status => 200 }
    end
  end


  private
  def check_required_params
    @device_id = params[:device_id]
    return render :json => { message: "Device ID is required.", :status => 422 } if @device_id.blank?
  end

  def check_device
    @device = DeviceTableMapping.where(device_id: @device_id)
    return render :json => { message: "Device ID does not exists.", :status => 422 } unless @device.any?
  end
end
