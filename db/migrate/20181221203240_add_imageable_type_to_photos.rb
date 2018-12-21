class AddImageableTypeToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :imageable_type, :string
  end
end
