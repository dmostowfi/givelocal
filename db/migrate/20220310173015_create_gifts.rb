class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :gift_name
      t.text :description
      t.string :photo
      t.integer :store_id
      t.integer :category_id

      t.timestamps
    end
  end
end
