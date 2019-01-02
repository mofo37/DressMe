class CreatePiecePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_photos do |t|
      t.string :url
      t.boolean :front
      t.boolean :back
      t.references :piece

      t.timestamps
    end
  end
end
