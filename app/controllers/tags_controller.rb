class TagsController < ApplicationController
  def index
    @tags = current_user.tags.uniq.sort_by { |tag| tag.name.downcase }
  end

  def show
    @tag = current_user.tags.find(params[:id])
    @items = [@tag.outfits, @tag.pieces].flatten
  end
end
