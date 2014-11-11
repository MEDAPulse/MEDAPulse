class TextMessage < ActiveRecord::Base
require 'twilio-ruby'

belongs_to :client, dependent: :destroy

def send_text_message
  
    number_to_send_to = client.phone
    message = text_message.content
 
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => message
       )
  end  
end
