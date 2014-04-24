class CreateUserFollowers < ActiveRecord::Migration
  def change
    create_table :user_followers do |t|
      t.belongs_to :follower
      t.belongs_to :followee
      # t.integer :follower_id
      # t.integer :followee_id
    end
  end
end
