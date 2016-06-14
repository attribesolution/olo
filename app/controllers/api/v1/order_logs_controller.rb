class Api::V1::OrderLogsController < ApiController
	before_action :verify_order, only: [:index]

	def index
		@order_logs = OrderLog.by_order_id(params[:order_id]).order('created_at ASC')
  end

  private
    def verify_order
      if params[:order_id]
        unless @user.orders.map{|c| c.id}.include? params[:order_id].to_i
          render :json => { :status => 401, message: "Invalid order ID." }
        end
      else
        render :json => { :status => 401, message: "Order ID is required." }
      end
    end
end
