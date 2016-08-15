class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    @user = user
    ReservationMailer.sample_email(@user).deliver_later
    ReservationMailer.email_to_restaurant(@user).deliver_later
  end
end
