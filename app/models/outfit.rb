class Outfit < ApplicationRecord
  belongs_to :user
  
  has_many :stylings
  has_many :pieces, through: :stylings
end
