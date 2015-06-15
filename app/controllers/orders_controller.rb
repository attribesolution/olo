class OrdersController < ApplicationController
	before_action :authenticate_user!

	layout 'empty', only: [:index]

	def index
		@orders = Order.by_user(current_user.id).order(created_at: :desc)
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
