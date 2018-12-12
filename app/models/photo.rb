class Photo < ApplicationRecord
  belongs_to :piece
  belongs_to :outfit
end
