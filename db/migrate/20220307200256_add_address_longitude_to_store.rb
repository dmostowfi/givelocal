class AddAddressLongitudeToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :address_longitude, :float
  end
end
