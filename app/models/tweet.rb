class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :retweets

  validates :message, length: {maximum: 140}

  def get_time
    Time.zone = 'Pacific Time (US & Canada)'
    self.created_at.strftime("%m/%d/%y at %I:%M%p")
  end
end
