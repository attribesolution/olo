class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def index
		if params[:lastReservationId]
      @reservations = Reservation.by_restaurant(current_user.id).from_reservation(params[:lastReservationId]).order(created_at: :desc)
    else
	    @reservations = Reservation.by_restaurant(current_user.id).order(created_at: :desc)
    end
    gon.lastReservationId = @reservations.first.id if @reservations.any?
    gon.autoFetchNewReservations = true
    respond_to :html, :js
	end
end
