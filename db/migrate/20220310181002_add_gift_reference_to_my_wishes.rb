class AddGiftReferenceToMyWishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :my_wishes, :gifts
    add_index :my_wishes, :gift_id
    change_column_null :my_wishes, :gift_id, false
  end
end
