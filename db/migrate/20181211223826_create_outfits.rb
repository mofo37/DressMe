class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.string :name
      t.integer :formality
      t.boolean :work

      t.timestamps
    end
  end
end
