class Api::V1::ReservationsController < ApiController
	
	def create
    begin
      binding.pry
      #reservation_time = Time.at((params[:time]).to_i/1000).to_s(:db)
      reservation_time = DateTime.strptime(params[:time].to_s,'%s')
      @reservation = Reservation.new(time: reservation_time, no_of_person: params[:no_of_person], phone: params[:phone], restaurant_owner_id: @user.id, name: params[:name], email: params[:email], branch_id: params[:branch_id])
      if @reservation.save!
	      render :json => { message: "Reservation created successfully.", :status => 200 }
      end
    rescue Exception => e
      binding.pry
      render :json => { message: e.message, :status => 200 }
    end
  end

end