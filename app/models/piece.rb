class Piece < ApplicationRecord
  has_many :stylings
  has_many :outfits, through: :stylings
end
