class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :outfit, foreign_key: true
      t.belongs_to :piece, foreign_key: true
      t.belongs_to :wishlist, foreign_key: true

      t.timestamps
    end
  end
end
