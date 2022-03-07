class AddGiftReferenceToGiftlists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :giftlists, :gifts
    add_index :giftlists, :gift_id
    change_column_null :giftlists, :gift_id, false
  end
end
