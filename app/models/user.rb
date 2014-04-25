class User < ActiveRecord::Base
  validates :handle, uniqueness: :true
  validates :email, uniqueness: :true

  has_many :tweets
  has_many :followings
  has_many :followers, class_name: "User", through: :followings, foreign_key: "follower_id"

  def following
    following = Following.where("follower_id = ?", self.id)
    following.map! { |followee| User.find(followee.user_id) }
    following
  end
end
