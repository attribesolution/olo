class VisitorsController < ApplicationController
	before_action :authenticate_user!

	def index
    if params[:lastOrderId]
      @orders = Order.by_restaurant(current_user.id).from_order(params[:lastOrderId]).order(created_at: :desc)
    else
      @orders = Order.by_restaurant(current_user.id).order(created_at: :desc)
    end
    gon.lastOrderId = @orders.first.id if @orders.any?
    
    respond_to :html, :js
  end

end
