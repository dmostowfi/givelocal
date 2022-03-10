class AddPhotoLatitudeToGift < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :photo_latitude, :float
  end
end
