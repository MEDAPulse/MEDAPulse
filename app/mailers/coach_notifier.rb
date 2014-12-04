class CoachNotifier < ActionMailer::Base
  default :from => 'clientalert@medapulse.org'

  def send_coach_email(coach_email_id)
    @coach_email = CoachEmail.find(coach_email_id)
    mail( :to => @coach_email.email,
    :subject => 'MEDAPulse Client Text Received' )
  end
end