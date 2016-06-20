class OrdersController < ApplicationController
	before_action :authenticate_user!

	layout 'empty', only: [:full_screen]

	def index
    @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
    gon.lastOrderId = @orders.first.id if @orders.any?
    gon.autoFetchNewOrders = true
	end

  def full_screen
    if params[:lastOrderId]
      @orders = Order.by_restaurant(current_user.id).from_order(params[:lastOrderId]).order(created_at: :desc)
    else
      @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
    end
    gon.lastOrderId = @orders.first.id if @orders.any?
    gon.autoFetchNewOrders = true

    if params[:pathname] == "/orders/full_screen"
      @fullScreen = true
    else
      @fullScreen = false
    end

    respond_to :html, :js
  end

	def update_status
		@order = Order.where(id: params[:id])

    begin
  		if @order.any?
  			@order = @order.first
  			@order.status = params[:status]
  			@order.save
  		end

      log = OrderLog.create(status: params[:status],order_id: @order.id,restaurant_owner_id: @order.restaurant_owner_id)    
      log.save

      respond_to :js
    rescue 
      flash[:fail] = "Status cannot be updated"
      render 'index'
      
    end
	end
end
