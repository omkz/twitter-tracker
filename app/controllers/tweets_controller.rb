class TweetsController < ApplicationController
  # before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
  end

  def fetch_tweets
    client.search("@rails", result_type: "recent", since: "#{1.day.ago.strftime("%Y-%m-%d")}", until: "#{Time.now.strftime("%Y-%m-%d")}").collect do |tweet|
      p ".. @#{tweet.user.screen_name}: #{tweet.text}"
      Tweet.create(:status => "@#{tweet.user.screen_name}: #{tweet.text}", :favorite => tweet.favorite_count, :retweet => tweet.retweet_count)
    end
  end

  def search
    @tweets = Tweet.search(params[:q]).order("created_at DESC")

    # @tweets.each { |tweet| tweet.scan(/@([a-z0-9_]+)/i).first }
    #
    @usernames = Array.new

    @tweets.each do |tweet|
      p username = tweet.status.scan(/@([a-z0-9_]+)/i).first
      @usernames << username
    end

    counts = Hash.new(0)
    @usernames.each { |name| counts[name] += 1 }

    p counts

    render json: @tweets
  end

end
