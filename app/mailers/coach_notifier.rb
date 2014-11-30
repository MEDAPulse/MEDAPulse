class CoachNotifier < ActionMailer::Base
  default :from => 'clientalert@medapulse.org'

  def send_coach_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Client Text Received' )
  end
end