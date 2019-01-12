class RemoveUrlFromOutfits < ActiveRecord::Migration[5.2]
  def change
    remove_column :outfits, :url, :string
  end
end
