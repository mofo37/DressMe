class Piece < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings
  has_many :outfits, through: :stylings
  has_many :piece_photos

  accepts_nested_attributes_for :piece_photos
  has_one_attached :image
end
