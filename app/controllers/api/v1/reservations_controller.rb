class Api::V1::ReservationsController < ApiController
	before_filter :branch_exist, only:[:create] 
	def create
    begin
      reservation_time = Time.at(params[:time])

      @reservation = Reservation.new(time: reservation_time, no_of_person: params[:no_of_person], phone: params[:phone], restaurant_owner_id: @user.id, name: params[:name], email: params[:email], branch_id: params[:branch_id])
      
      if @reservation.save!
        @email = @reservation.restaurant_owner.notification_email
        ReservationMailer.email_to_restaurant(@reservation, @email).deliver_now unless @email.nil?
        ReservationMailer.email_to_customer(@reservation).deliver_now
        
        #SendEmailJob.set(wait: 5.seconds).perform_later(@reservation, @email)
        #ReservationMailer.sample_email(@reservation).deliver
	      
        render :json => { message: "Reservation created successfully.", :status => 200 }
      end
    rescue Exception => e
      render :json => { message: e.message, :status => 400 }
    end
  end

private
  def branch_exist
    branch = Branch.find_by_id(params[:branch_id])
    if branch
      return
    else
      render :json => { message: "This branch doesn't exist", :status => 400 }
    end
  end

end