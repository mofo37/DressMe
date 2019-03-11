class ChangeTaggingsToUseTaggable < ActiveRecord::Migration[5.2]
  def change
    remove_column :taggings, :outfit_id, :integer
    remove_column :taggings, :piece_id, :integer
    remove_column :taggings, :wishlist_id, :integer
    add_column :taggings, :taggable_id, :integer
    add_column :taggings, :taggable_type, :string
  end
end
