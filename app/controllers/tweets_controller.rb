class TweetsController < ApplicationController
  def index
    Rufus::Scheduler.singleton.in '5s' do
      Rails.logger.info "time flies, it's now #{Time.now}"
    end
  end

  def fetch_tweets
    client.search("@rails", result_type: "recent", since: "#{1.day.ago.strftime("%Y-%m-%d")}", until: "#{Time.now.strftime("%Y-%m-%d")}").collect do |tweet|
      p ".. @#{tweet.user.screen_name}: #{tweet.text}"
      Tweet.create(:status => "@#{tweet.user.screen_name}: #{tweet.text}", :favorite => tweet.favorite_count, :retweet => tweet.retweet_count)
    end
  end
end
