class Tag < ApplicationRecord
  has_many :taggings
  has_many :outfits, through: :taggings, source: :taggable, source_type: "Outfit"
  has_many :pieces, through: :taggings, source: :taggable, source_type: "Piece"
  has_many :wishlists, through: :taggings, source: :taggable, source_type: "Wishlist"
end
