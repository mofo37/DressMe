class DropOutfitPhotos < ActiveRecord::Migration[5.2]
  def change
    drop_table :outfit_photos
  end
end
