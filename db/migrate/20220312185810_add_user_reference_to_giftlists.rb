class AddUserReferenceToGiftlists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :giftlists, :users
    add_index :giftlists, :user_id
    change_column_null :giftlists, :user_id, false
  end
end
