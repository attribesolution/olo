class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, email)
    @user = user
    ReservationMailer.email_to_restaurant(@user, email).deliver_later
    ReservationMailer.email_to_customer(@user).deliver_later
    
  end
end
