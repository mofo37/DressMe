class Outfit < ApplicationRecord
  belongs_to :user

  has_many :stylings, dependent: :destroy
  has_many :pieces, through: :stylings
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  has_many_attached :images

  after_save :auto_orient

  def auto_orient
    manipulate! do |image|
      image.auto_orient
      image
    end
  end

end
