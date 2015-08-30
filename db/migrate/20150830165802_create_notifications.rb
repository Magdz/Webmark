class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
