class AddCategoryIdToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :category_id, :integer
    add_index :subcategories, :category_id
  end
end
