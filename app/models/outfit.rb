class Outfit < ApplicationRecord
  has_many :stylings
  has_many :pieces, through: :stylings
end
