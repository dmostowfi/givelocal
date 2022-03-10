class AddCategoryReferenceToGifts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gifts, :categories
    add_index :gifts, :category_id
    change_column_null :gifts, :category_id, false
  end
end
