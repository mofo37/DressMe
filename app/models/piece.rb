class Piece < ApplicationRecord
  belongs_to :user

  has_many :stylings, dependent: :destroy
  has_many :outfits, through: :stylings
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many_attached :images

  scope :list_order, -> { order(created_at: :desc) }
  scope :by, ->(user) { where(user_id: user.id) }
end
