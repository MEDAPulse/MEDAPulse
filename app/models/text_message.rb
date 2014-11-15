class TextMessage < ActiveRecord::Base
require 'twilio-ruby'

belongs_to :client, dependent: :destroy
belongs_to :step, dependent: :destroy

before_save :grab_phone

def grab_phone
  self.phone = step.goal.action_plan.client.phone
end

  def send_text_message(message, phone)

    twilio_sid = ENV["TWILIO_ACCT_SID"]
    twilio_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]
 
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => phone,
      :body => message)
  end  
end
