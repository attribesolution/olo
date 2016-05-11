class Api::V1::OrdersController < ApiController
  before_action :get_device_table_mapping, only: [:create]

	def create
    order_time = DateTime.strptime(params[:order_time].to_s,'%s')
    @order = Order.create(table_no: params[:table_no], order_total: params[:order_total], order_time: order_time, table_cover: params[:table_cover], restaurant_owner_id: @user.id, device_table_mapping_id: @device.first.id)
    order_detail = params[:order_detail]
        
    order_detail.each do |detail|
      OrderDetail.create(order_id: @order.id, menu_id: detail[:menu_id], quantity: detail[:quantity], item_price: detail[:item_price], item_name: detail[:item_name])
    end
    
    render :json => { message: "Order created successfully.", :status => 200 }
  end

  private
    def get_device_table_mapping
      device_id = params[:device_id]
      @device = DeviceTableMapping.where(device_id: device_id, restaurant_owner_id: @user.id)

      render :json => { message: "Invalid Device ID.", :status => 422 } unless @device.any?
    end
end
