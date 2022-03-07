class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
