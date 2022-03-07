class CreateMyWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :my_wishes do |t|
      t.integer :user_id
      t.integer :gift_id

      t.timestamps
    end
  end
end
