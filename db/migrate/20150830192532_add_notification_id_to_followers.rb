class AddNotificationIdToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :notification_id, :integer
  end
end
