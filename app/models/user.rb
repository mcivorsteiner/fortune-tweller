require 'gravtastic'

class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :secure => true, :filetype => :gif, :size => 150, :default => "monsterid"
  validates :handle, uniqueness: :true, presence: true,
            format: { with: /\A[a-zA-Z0-9_-]+\Z/, message: "Invalid handle format." }
  validates :email, uniqueness: :true
  has_many :tweets
  has_many :followings
  has_many :followers, class_name: "User", through: :followings, foreign_key: "follower_id"

  def following
    following = Following.where("follower_id = ?", self.id)
    following.map! { |followee| User.find(followee.user_id) }
    following
  end

  def self.create_gravatar email
    current_user = User.find_by_email(email)
    g_url = current_user.gravatar_url
    current_user.update_attributes(g_url)
  end

  def follower_count
    followers.length
  end

  def following_count
    following.length
  end
end
