class Tweet < ActiveRecord::Base
  validates :message, :presence => true, :length => {
    :in => 1..50,
    :too_short => "Tweet must be at least one character.",
    :too_long => "Tweet must be less than 140 characters."}
  belongs_to :user
  has_many :retweets


  def get_time
    Time.zone = 'Pacific Time (US & Canada)'
    self.created_at.strftime("%m/%d/%y at %H:%M%p")
  end

end
