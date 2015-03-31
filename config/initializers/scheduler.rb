require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '5s' do
  # puts "Fetch tweets ..."
  # t = TweetsController.new
  # t.fetch_tweets
  # puts "done."

  s.every '5s' do
    Rails.logger.info "hello, it's #{Time.now}"
    puts "hello, it's #{Time.now}"
  end
end


