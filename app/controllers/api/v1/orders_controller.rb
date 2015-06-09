class Api::V1::OrdersController < ApiController
  before_action :get_device_table_mapping, only: [:create]
  before_action :get_table_no, only: [:create]

	def create
    @order = Order.create(table_no: @table_no, order_total: params[:order_total], restaurant_owner_id: @device.first.restaurant_owner_id, device_table_mapping_id: @device.first.id)
    order_detail = params[:order_detail]
        
    order_detail.each do |detail|
      OrderDetail.create(order_id: @order.id, menu_id: detail[:menu_id], quantity: detail[:quantity], item_price: detail[:item_price], item_name: detail[:item_name])
    end
    
    render :json => { message: "Order created successfully.", :status => 200 }
  end

  private
    def get_device_table_mapping
      device_id = params[:device_id]
      @device = DeviceTableMapping.where(device_id: device_id)

      render :json => { message: "Invalid Device ID.", :status => 422 } unless @device.any?
    end

    def get_table_no
      if params[:table_no].blank?
        @table_no = @device.first.table_no
      else
        @table_no = params[:table_no]
      end
    end
end
