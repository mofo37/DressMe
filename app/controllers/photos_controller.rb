class PhotosController < ApplicationController
  before_action :authorize

  def index
    @photos = [current_user.pieces, current_user.outfits].flatten
  end
end
