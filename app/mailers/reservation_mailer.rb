class ReservationMailer < ApplicationMailer
	def email_to_customer(user)
    @user = user
    mail(to: @user.email, subject: 'This is for customer')
  end
  
  def email_to_restaurant(reservation)
  	@reservation = reservation
  	
  	@time = Time.at(@reservation.time)
  	mail(to: 'salman.jamilsst@gmail.com', subject: 'This is for restaurant call center')
  end

end
