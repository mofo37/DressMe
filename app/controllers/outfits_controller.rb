class OutfitsController < ApplicationController
  before_action :authorize
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]

  def index
    @outfits = current_user.outfits.list_order
  end

  def show
  end

  def new
    @outfit = Outfit.new
    @pieces = current_user.pieces
  end

  def edit
    @pieces = current_user.pieces
  end

  def create
    tags = params[:tags]
    @outfit = current_user.outfits.new(outfit_params)

    if @outfit.save
      tags.downcase.split(',').each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        @outfit.taggings.create(user_id: current_user.id, tag_id: tag.id)
      end

      redirect_to @outfit, notice: 'Outfit was successfully created.'
    else
      render :new
    end
  end

  # TODO make tagging on update and create more idiomatic
  def update
    tags = params[:tags]
    @outfit.taggings.destroy_all

    tags.downcase.split(',').each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      @outfit.taggings.create(user_id: current_user.id, tag_id: tag.id)
    end

    if @outfit.update(outfit_params)
      redirect_to @outfit, notice: 'Outfit was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @outfit.destroy
    redirect_to outfits_url, notice: 'Outfit was successfully destroyed.'
  end

  def delete_image
    attachment = ActiveStorage::Attachment.find(params[:image_id])
    attachment.purge
    redirect_back(fallback_location: new_outfit_path)
  end

  private

  def set_outfit
    @outfit = current_user.outfits.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :formality, :work, :tags, piece_ids: [], images: [])
  end
end
