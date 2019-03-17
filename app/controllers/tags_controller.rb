class TagsController < ApplicationController
  def index
    @tags = current_user.tags.uniq.sort_by { |tag| tag.name.downcase }
  end

  def show
    @tag = current_user.tags.find(params[:id])

    @items = {}
    [@tag.outfits, @tag.pieces].flatten.each do |item|
      item.images.each do |image|
        @items[image] = item
      end
    end
    @items = @items.to_a
  end
end
