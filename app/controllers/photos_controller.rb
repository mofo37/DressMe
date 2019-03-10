class PhotosController < ApplicationController

  def index
    if current_user
      @photos = [current_user.pieces, current_user.outfits].flatten
    end
  end
end

      # collections = collections.map { |o| o.images if o.images.attached? }.compact
      # @photos = []
      # collections.each do |collection|
      #   collection.each do |attachment|
      #     @photos << attachment
      #   end
      # end