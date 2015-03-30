class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['twitter_api_key']
      config.consumer_secret = ENV['twitter_api_secret']
    end
  end
end
