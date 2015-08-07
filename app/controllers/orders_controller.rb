class OrdersController < ApplicationController
	before_action :authenticate_user!

	layout 'empty', only: [:full_screen]

	def index
    @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
	end

  def full_screen
    if params[:lastOrderId]
      @orders = Order.by_restaurant(current_user.id).from_order(params[:lastOrderId]).order(created_at: :desc)
    else
      @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
    end
    gon.lastOrderId = @orders.first.id if @orders.any?
    gon.fetchNewOrders = true

    respond_to :html, :js
  end

	def update_status
		@order = Order.where(id: params[:id])

		if @order.any?
			@order = @order.first
			@order.status = params[:status]
			@order.save
		end

		respond_to :js
	end
end
