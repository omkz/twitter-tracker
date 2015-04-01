class Tweet < ActiveRecord::Base

  def self.search(query)
    where("status like ?", "%#{query}%")
  end
end
