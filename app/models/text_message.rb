class TextMessage < ActiveRecord::Base
require 'twilio-ruby'

belongs_to :client, dependent: :destroy

  def send_text_message(message)
  
    number_to_send_to = client.phone

    twilio_sid = ENV["TWILIO_ACCT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]
 
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => message)
  end  
end
