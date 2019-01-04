class AddUrlToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :url, :string
  end
end
