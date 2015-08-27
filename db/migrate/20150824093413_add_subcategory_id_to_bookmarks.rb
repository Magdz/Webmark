class AddSubcategoryIdToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :subcategory_id, :integer
    add_index :bookmarks, :subcategory_id
  end
end
