class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def index
    @reservations = Reservation.by_restaurant(current_user.id).order(created_at: :desc)
    gon.lastReservationId = @reservations.first.id if @reservations.any?
    gon.autoFetchNewReservations = true
	end
end
