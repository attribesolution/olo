
	json.extract! @order, :id, :order_total, :name, :phone, :address
	json.order_details(@order.order_details) do |order_detail|
		json.extract! order_detail, :menu_id, :quantity, :item_price, :item_name
	end
