class TagsController < ApplicationController
  def index
    @tags = current_user.tags.uniq.sort_by { |tag| tag.name.downcase }
  end

  def show
    @tag = Tag.find(params[:id])
    outfits = @tag.outfits.where(user_id: current_user.id)
    pieces = @tag.pieces.where(user_id: current_user.id)

    @items = {}
    [outfits, pieces].flatten.each do |item|
      item.images.each do |image|
        @items[image] = item
      end
    end
    @items = @items.to_a
  end
end
