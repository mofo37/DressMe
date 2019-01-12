class RemoveUrlFromPieces < ActiveRecord::Migration[5.2]
  def change
    remove_column :pieces, :url, :string
  end
end
