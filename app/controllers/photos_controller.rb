class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.json
  def index
    piece_photos = current_user.pieces.map { |p| p.piece_photos }
    outfit_photos = current_user.outfits.map { |o| o.outfit_photos }
    @photos = [outfit_photos, piece_photos].flatten
  end
end
