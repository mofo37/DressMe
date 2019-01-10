class Outfit < ApplicationRecord
  belongs_to :user, optional: true

  has_many :stylings, dependent: :destroy
  has_many :pieces, through: :stylings

  has_many_attached :images
end
