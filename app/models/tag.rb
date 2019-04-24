class Tag < ApplicationRecord
  has_many :taggings
  has_many :outfits, through: :taggings, source: :taggable, source_type: "Outfit"
  has_many :pieces, through: :taggings, source: :taggable, source_type: "Piece"
  has_many :wishlists, through: :taggings, source: :taggable, source_type: "Wishlist"

  validates :name, presence: true, uniqueness: true

  def outfits_by(user)
    outfits.by(user)
  end

  def pieces_by(user)
    pieces.by(user)
  end
end
