class CoachNotifier < ActionMailer::Base
  default :from => 'clientalert@medapulse.org'

  def send_coach_email(coach_email)
    @coach_email = coach_email
    mail( :to => @coach_email.email,
    :subject => 'MEDAPulse Client Text Received' )
  end
end