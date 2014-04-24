class User < ActiveRecord::Base
  has_many :tweets
  has_many :followings
  has_many :followers, class_name: "User", through: :followings, foreign_key: "follower_id"
end
