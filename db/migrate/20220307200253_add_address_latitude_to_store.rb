class AddAddressLatitudeToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :address_latitude, :float
  end
end
