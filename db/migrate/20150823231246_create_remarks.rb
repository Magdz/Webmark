class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.integer :bookmark_id
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :remarks, :bookmark_id
  end
end
