class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :retweets

  validates :message, length: {maximum: 140}
end
