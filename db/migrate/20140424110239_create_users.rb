class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :name
      t.string :password_hash
      t.string :user_gravitar_url
      t.timestamps
    end
  end
end
