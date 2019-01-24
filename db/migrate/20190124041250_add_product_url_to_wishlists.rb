class AddProductUrlToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_column :wishlists, :product_url, :string
  end
end
