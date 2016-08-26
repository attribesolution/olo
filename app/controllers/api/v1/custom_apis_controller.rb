class Api::V1::CustomApisController < ApiController
  def create_order
    @order = Order.create(name: params[:name], phone: params[:phone], address: params[:address], restaurant_owner_id: @user.id)
    order_total = 0
    order_detail = params[:order_detail]
        
    order_detail.each do |detail|
      @menu = Menu.find_by_id(detail[:menu_id])
      OrderDetail.create(order_id: @order.id, menu_id: detail[:menu_id], quantity: detail[:quantity], item_price: @menu.price, item_name: @menu.name)
      order_total += @menu.price * detail[:quantity]
    end
    @order.order_total = order_total
    @order.save
    render :json => { message: "Order created successfully.", :status => 200 }
  end
end