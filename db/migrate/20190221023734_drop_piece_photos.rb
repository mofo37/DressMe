class DropPiecePhotos < ActiveRecord::Migration[5.2]
  def change
    drop_table :piece_photos
  end
end
