require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '5s' do
  # puts "Fetch tweets ..."
  t = TweetsController.new
  t.fetch_tweets
  # puts "done."
end


