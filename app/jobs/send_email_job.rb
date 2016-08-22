class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, email, time)
    @user = user
    ReservationMailer.email_to_restaurant(@user, email, time).deliver_later
    ReservationMailer.email_to_customer(@user).deliver_later
    
  end
end
