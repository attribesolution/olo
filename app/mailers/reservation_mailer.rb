class ReservationMailer < ApplicationMailer
	def email_to_customer(user)
    @user = user
    mail(to: @user.email, subject: 'Kababjees Table Reservation')
  end
  
  def email_to_restaurant(reservation, email)
  	@reservation = reservation
  	mail(to: email, subject: 'New Table Reservation')
  end

end
