class AddBookmarkIdToRemarks < ActiveRecord::Migration
  def change
    add_column :remarks, :bookmark_id, :integer
    add_index :remarks, :bookmark_id
  end
end
