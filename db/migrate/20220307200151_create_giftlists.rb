class CreateGiftlists < ActiveRecord::Migration[6.0]
  def change
    create_table :giftlists do |t|
      t.integer :user_id
      t.string :friend_name
      t.integer :gift_id

      t.timestamps
    end
  end
end
