class AddImageableIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :imageable_id, :integer
  end
end
