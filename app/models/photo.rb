class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true
  
  belongs_to :piece, optional: true, required: false
  belongs_to :outfit, optional: true, required: false 
end
