set :environment, "production"

every :day, :at => '12pm' do 
  rake "send_scheduled_text"
end