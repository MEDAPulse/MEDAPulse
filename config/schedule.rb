set :environment, "production"

# 8pm UTC since the desired time is 12pm PST (Ninefold runs on UTC time)

# Production: 
# every :day, :at => '8pm' do

#Testing
every 5.minutes do 
  rake "send_scheduled_text:texts"
end

set :output, '/var/www/apps/11222/current/log/custom_deploy_after_migrate.log'