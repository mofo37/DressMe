class Outfit < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings
  has_many :pieces, through: :stylings
  has_many :outfit_photos

  accepts_nested_attributes_for :outfit_photos
end
