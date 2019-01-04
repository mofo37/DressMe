class Piece < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings
  has_many :outfits, through: :stylings

  has_one_attached :image
end
