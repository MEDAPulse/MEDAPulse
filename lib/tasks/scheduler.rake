desc "This task is called by the Heroku scheduler add-on"
namespace :send_scheduled_text do
  
  task :texts => :environment do

    TextMessage.all.each do |text_message|
      if text_message.sentstatus == false
        if (Date.today > text_message.scheduled_date)
          SendTextWorker.new.async(text_message.id)
        elsif (Date.today == text_message.scheduled_date)
          if (Time.now.hour >= text_message.scheduled_time.hour)
            if (Time.now.min >= text_message.scheduled_time.min)
              SendTextWorker.new.async(text_message.id)
            end
          end
        end
      end
    end
  end
end