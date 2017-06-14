class OrdersController < ApplicationController
	before_action :authenticate_user!

	layout 'empty', only: [:full_screen]

	def index
    
    if params[:search]
      @orders=Order.by_restaurant(current_user.id).search(params[:search]).page(params[:page]).per(10).order(created_at: :desc)
    else
      @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
      @orders = @orders.where(created_at: 12.hours.ago..Time.now).page(params[:page]).per(10)
    end
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

		if @order.any?
			@order = @order.first
			@order.status = params[:status]
      
      if @order.save
        # create an Order Log each time order status changes
        order_log = @order.order_logs.build(status: params[:status])
        order_log.save
      end
    end


		respond_to :js
	end
end
