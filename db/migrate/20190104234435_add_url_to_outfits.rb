class AddUrlToOutfits < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :url, :string
  end
end
