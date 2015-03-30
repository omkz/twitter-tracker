namespace :tweet do
  desc "fetching data from Twitter API"
  task fetch: :environment do
    puts "Fetch tweets ..."
    t = TweetsController.new
    t.fetch_tweets
    puts "done."
  end

end
