class AddNotesToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :notes, :text
  end
end
