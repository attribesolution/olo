class AdminMailer < ApplicationMailer
  def new_user_waiting_for_approval(user)
    @user = user
    mail(to: "Dmenu - Support Team <support@dmenu.co>", subject: 'New user signed up and waiting for approval.')
  end
end
