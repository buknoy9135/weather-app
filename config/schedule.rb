# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every 15.minutes do
#   command "/usr/bin/env bundle exec rake weather:fetch RAILS_ENV=development >> /home/buknoy/weather_cron.log 2>&1"
# end

# set :output, "/home/buknoy/weather_cron.log"

# Use this file to easily define all of your cron jobs.
# Learn more: http://github.com/javan/whenever

# Set environment
set :environment, "development"  # Change to "production" when deploying
set :output, "log/cron.log"      # Log cron job output

# Add rbenv initialization
job_type :rake, "cd :path && /home/jalil/.rbenv/shims/bundle exec rake :task --silent :output"

# Fetch weather forecasts every hour
every 15.minutes do
  rake "weather:fetch"
end

# Or run at specific times:
# every 1.day, at: '6:00 am' do
#   rake "weather:fetch_forecasts"
# end

# Or multiple times per day:
# every 1.day, at: ['6:00 am', '12:00 pm', '6:00 pm'] do
#   rake "weather:fetch_forecasts"
# end

# Or every 30 minutes:
# every 30.minutes do
#   rake "weather:fetch_forecasts"
# end
