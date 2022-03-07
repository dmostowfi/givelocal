class AddStoreReferenceToGifts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gifts, :stores
    add_index :gifts, :store_id
    change_column_null :gifts, :store_id, false
  end
end
