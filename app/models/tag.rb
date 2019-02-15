class Tag < ApplicationRecord
  has_many :taggings
  has_many :outfits, through :taggings
  has_many :pieces, through :taggings
  has_many :wishlists, through :taggings
end
