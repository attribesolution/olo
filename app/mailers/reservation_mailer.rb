class ReservationMailer < ApplicationMailer
	def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'This is for customer')
  end
  def email_to_restaurant(reservation)
  	@reservation = reservation
  	mail(to: 'salman.jamilsst@gmail.com', subject: 'This is for restaurant call center')
  end

end
