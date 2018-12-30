class Outfit < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings
  has_many :pieces, through: :stylings
  has_many :photos, as: :imageable

  accepts_nested_attributes_for :photos
end
