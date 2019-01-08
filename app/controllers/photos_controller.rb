class PhotosController < ApplicationController

  def index
    collections = [current_user.pieces].flatten
    collections = collections.map { |o| o.images if o.images.attached? }.compact
    @photos = []
    collections.each do |collection|
      collection.each do |attachment|
        @photos << attachment
      end
    end
  end
end
