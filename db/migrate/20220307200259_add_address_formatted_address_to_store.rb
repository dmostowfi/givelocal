class AddAddressFormattedAddressToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :address_formatted_address, :string
  end
end
