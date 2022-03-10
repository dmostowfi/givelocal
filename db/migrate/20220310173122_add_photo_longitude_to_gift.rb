class AddPhotoLongitudeToGift < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :photo_longitude, :float
  end
end
