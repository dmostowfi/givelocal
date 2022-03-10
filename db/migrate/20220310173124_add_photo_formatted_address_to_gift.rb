class AddPhotoFormattedAddressToGift < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :photo_formatted_address, :string
  end
end
