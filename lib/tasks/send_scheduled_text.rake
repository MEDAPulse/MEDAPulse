require_relative '../../app/workers/send_text_worker'

namespace :send_scheduled_text do
  
  task:texts => :environment do

    TextMessage.all.each do |text|
      SendTextWorker.perform_async(text_message.id)
      sleep 1
    end
  end
end