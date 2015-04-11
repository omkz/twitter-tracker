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


    @counts = count_username_mentions(@tweets)

    render json: {:tweets => @tweets, :counts => @counts}

  end

  def count_username_mentions(tweets)

    @usernames = Array.new

    tweets.each do |tweet|

      #get username from all of tweets searched using regexp
      username = tweet.status.match(/@([a-z0-9_]+)/i).to_s

      @usernames << username
    end

    # count array elements
    @usernames.group_by{|i| i}.map{|k,v| [k, v.count] }

  end

end


