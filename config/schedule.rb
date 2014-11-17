set :environment, "production"

# 8pm UTC since the desired time is 12pm PST (Ninefold runs on UTC time)

every :day, :at => '8pm' do 
  rake "send_scheduled_text:texts"
end