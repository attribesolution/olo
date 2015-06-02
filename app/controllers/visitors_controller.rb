class VisitorsController < ApplicationController
	before_action :authenticate_user!

	def index
    @orders = Order.by_user current_user.id
  end
end
