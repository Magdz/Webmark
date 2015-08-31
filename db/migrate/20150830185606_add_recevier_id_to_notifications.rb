class AddRecevierIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :recevier_id, :integer
  end
end
