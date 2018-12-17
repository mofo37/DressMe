class Piece < ApplicationRecord
  belongs_to :user
  
  has_many :stylings
  has_many :outfits, through: :stylings
end
