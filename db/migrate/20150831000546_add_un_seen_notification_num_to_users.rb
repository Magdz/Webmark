class AddUnSeenNotificationNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :un_seen_notification_num, :integer , :null => false, :default => 0
  end
end
