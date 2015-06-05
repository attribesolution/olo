class Api::V1::OrdersController < ApiController
  before_action :get_table, only: [:create]

	def create
    @order = Order.create(table_no: @device.first.id, order_total: params[:order_total], restaurant_owner_id: @device.first.restaurant_owner_id)
    order_detail = params[:order_detail]
        
    order_detail.each do |detail|
      OrderDetail.create(order_id: @order.id, menu_id: detail[:menu_id], quantity: detail[:quantity], item_total: detail[:item_total])
    end
    
    render :json => { message: "Order created successfully.", :status => 200 }
  end

  private
    def get_table
      device_id = params[:device_id]
      @device = DeviceTableMapping.where(device_id: device_id)

      render :json => { message: "Invalid Device ID.", :status => 422 } unless @device.any?
    end
end
