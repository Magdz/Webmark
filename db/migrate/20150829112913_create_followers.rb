class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :followers, :follower_id
    add_index :followers, :followed_id
  end
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :followings, :followed_id
    add_index :followings, :user_id
  end
end
