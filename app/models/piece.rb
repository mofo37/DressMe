class Piece < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings, dependent: :destroy
  has_many :outfits, through: :stylings

  has_many_attached :images
end
