require_relative '../../app/workers/send_text_worker'

namespace :send_scheduled_text do
  
  task:texts => :environment do

    TextMessage.all.each do |text_message|
      if ((text_message.sentstatus == false) && (Date.today == text_message.scheduled_date))
      # Future Sidekiq code: 
      # SendTextWorker.perform_async(text_message.id)
        text_message.send_text_message(text_message.content)
      end
    end
  end
end