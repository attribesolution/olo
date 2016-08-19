# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def sample_mail_preview
    ReservationMailer.email_to_customer(Reservation.first)
    ReservationMailer.email_to_restaurant(Reservation.first, 'salmanqureshi3029@gmail.com', '1472526000')
  end
end
