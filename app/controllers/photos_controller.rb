class PhotosController < ApplicationController
  def index
    if current_user
      @photos = [current_user.pieces, current_user.outfits].flatten
    end
  end
end
