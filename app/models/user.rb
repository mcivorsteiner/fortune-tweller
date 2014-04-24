class User < ActiveRecord::Base
  has_many :tweets
  has_many :user_followers
  has_many :followers, class_name: "User", through: :user_followers, foreign_key: "follower_id"
  has_many :followees, class_name: "User", through: :user_followers, foreign_key: "followee_id"
end
