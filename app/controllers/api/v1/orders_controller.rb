class Api::V1::OrdersController < ApiController
  # before_action :get_device_table_mapping, only: [:create]

	def print
    @order = Order.where(is_printed: false).first
    if @order
      @order.update_attribute(:is_printed, true)    
    end
    

  end

  def create
    require 'httparty'
    # require 'firebase'
    # firebase_uri = "https://delivodriver.firebaseio.com"
    # @firebase = Firebase::Client.new(firebase_uri)
    order_detail = params[:order_detail]
    if order_detail.nil?
      render :json => { message: "Order cannot be created without order detail", :status => 422 }
    else
      order_time = DateTime.strptime(params[:order_time].to_s,'%s')
      @order = Order.create(name: params[:name], phone: params[:phone], address: params[:address], order_total: params[:order_total], order_time: order_time, restaurant_owner_id: @user.id, device_os: params[:device_os])
      order_detail.each do |detail|
        OrderDetail.create(order_id: @order.id, menu_id: detail[:menu_id], quantity: detail[:quantity], item_price: detail[:item_price], item_name: detail[:item_name], uuid: detail[:uuid])
      end
      
      response = HTTParty.post("https://delivodriver.firebaseio.com/DeliveryRequest.json", body: { "name": params[:name], "phone": params[:phone], "address": params[:address], "order_total": params[:order_total], "order_time": params[:order_time], "device_os": params[:device_os], "order_detail": params[:order_detail]}.to_json)
      render :json => { message: "Order created successfully.", :status => 200 }

    end
  end

  private
    def get_device_table_mapping
      device_id = params[:device_id]
      @device = DeviceTableMapping.where(device_id: device_id, restaurant_owner_id: @user.id)

      render :json => { message: "Invalid Device ID.", :status => 422 } unless @device.any?
    end
end
