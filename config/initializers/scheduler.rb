require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

# do something every day, five minutes after midnight
s.cron '5 0 * * *' do
  puts "Fetch tweets ..."
  t = TweetsController.new
  t.fetch_tweets
  puts "done."
end

# s.every '5s' do
#   Rails.logger.info "hello, it's #{Time.now}"g
#   puts "hello, it's #{Time.now}"
# end

# scheduler.cron '0 23 * * *', :times => 31 do
#   # ... do something every day at 23:00 but do it no more than 31 times
# end


