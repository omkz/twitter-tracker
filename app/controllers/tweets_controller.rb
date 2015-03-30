class TweetsController < ApplicationController
  def index
  end

  def fetch_tweets
    client.search("jogja", result_type: "recent", since: "#{1.day.ago.strftime("%Y-%m-%d")}", until: "#{Time.now.strftime("%Y-%m-%d")}").collect do |tweet|
      p ".. @#{tweet.user.screen_name}: #{tweet.text}"
      Tweet.create(:status => "@#{tweet.user.screen_name}: #{tweet.text}", :favorite => tweet.favorite_count, :retweet => tweet.retweet_count)
    end
  end
end
