class Api::V1::ReservationsController < ApiController
	
	def create
    begin
      reservation_time = DateTime.strptime(params[:time].to_s,'%s')
      @reservation = Reservation.new(time: reservation_time, no_of_person: params[:no_of_person], phone: params[:phone], restaurant_owner_id: @user.id)
      if @reservation.save!
	      render :json => { message: "Reservation created successfully.", :status => 200 }
      end
    rescue Exception => e
      render :json => { message: e.message, :status => 200 }
    end
  end

end