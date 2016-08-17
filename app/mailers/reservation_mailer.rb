class ReservationMailer < ApplicationMailer
	def email_to_customer(user)
    @user = user
    mail(to: @user.email, subject: 'This is for customer')
  end
  
  def email_to_restaurant(reservation, email)
  	@reservation = reservation
  	
  	@time = Time.at(@reservation.time)
  	mail(to: email, subject: 'This is for restaurant call center')
  end

end
