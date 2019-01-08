class PhotosController < ApplicationController

  def index
    @collections = [current_user.pieces].flatten
    # , current_user.outfits
    # @photos = collections.map {|o| o.images }

  end
end
