class WishlistsController < ApplicationController
  before_action :authorize
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]


  def index
    @wishlists = current_user.wishlists
  end

  def show
  end

  def new
    @wishlist = Wishlist.new
  end

  def edit
  end

  def create
    tags = params[:tags]
    @wishlist = current_user.wishlists.new(wishlist_params)

    if @wishlist.save
      tags.split(',').each do |tag|
        @wishlist.tags.create(name: tag.strip)
      end

      redirect_to @wishlist, notice: 'Wishlist was successfully created.'
    else
      render :new
    end
  end

  def update

    tags = params[:tags]
    @wishlist.taggings.destroy_all

    tags.split(',').each do |tag|
      @wishlist.tags.create(name: tag.strip)
    end

    if @wishlist.update(wishlist_params)
      redirect_to @wishlist, notice: 'Wishlist was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wishlist.destroy
    redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.'
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.require(:wishlist).permit(:url, :notes, :product_url, :tags)
  end
end
