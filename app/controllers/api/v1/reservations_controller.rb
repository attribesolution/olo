class Api::V1::ReservationsController < ApiController
	
	def create
    begin
      reservation_time = DateTime.strptime(params[:time].to_s,'%s')

      @reservation = Reservation.new(time: reservation_time, no_of_person: params[:no_of_person], phone: params[:phone], restaurant_owner_id: @user.id, name: params[:name], email: params[:email], branch_id: params[:branch_id])
      
      if @reservation.save!
        @email = @reservation.restaurant_owner.notification_email
        SendEmailJob.set(wait: 10.seconds).perform_later(@reservation, @email, params[:time])
        #ReservationMailer.sample_email(@reservation).deliver
	      render :json => { message: "Reservation created successfully.", :status => 200 }
      end
    rescue Exception => e
      render :json => { message: e.message, :status => 200 }
    end
  end

end