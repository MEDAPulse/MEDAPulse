require_relative '../../app/workers/send_text_worker'

namespace :send_scheduled_text do
  
  task:texts => :environment do

    TextMessage.all.each do |text_message|
      if text_message.sentstatus == false
        if (Date.today == text_message.scheduled_date) && (Time.now.hour >= text_message.scheduled_time.hour)
        # Sidekiq code: 
        SendTextWorker.perform_async(text_message.id)
        end
      end
    end
  end
end