class AddFavoritesAndRetweetsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :favorite, :int
    add_column :tweets, :retweet, :int
  end
end
