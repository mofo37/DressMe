class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :outfit
  belongs_to :piece
  belongs_to :wishlist
end
