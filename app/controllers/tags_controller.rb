class TagsController < ApplicationController
  def index
    @tags = current_user.tags.uniq.sort_by { |tag| tag.name.downcase }
  end

  def show
    @tag = Tag.find(params[:id])
    outfits = @tag.outfits_by(current_user)
    pieces = @tag.pieces_by(current_user)

    @items = []
    [outfits, pieces].flatten.each do |item|
      item.images.each do |image|
        @items << [image, item]
      end
    end
  end
end
