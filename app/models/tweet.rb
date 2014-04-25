class Tweet < ActiveRecord::Base
  validates :message, :presence => true, :length => {
    :in => 1..140,
    :too_short => "Tweet must be at least one character.",
    :too_long => "Tweet must be less than 140 characters."}
  belongs_to :user
  has_many :retweets
end
