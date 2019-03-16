class PiecesController < ApplicationController
  before_action :authorize
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  def index
    @pieces = current_user.pieces
  end

  def show
  end

  def new
    @piece = Piece.new
  end

  def edit
  end

  def create
    tags = params[:tags]
    @piece = current_user.pieces.new(piece_params)

    if @piece.save
      tags.split(',').each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        @piece.taggings.create(user_id: current_user.id, tag_id: tag.id)
      end
      redirect_to @piece, notice: 'Piece was successfully created.'
    else
      render :new
    end
  end

  # TODO make tagging on update and create more idiomatic
  def update

    tags = params[:tags]
    @piece.taggings.destroy_all

    tags.split(',').each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      @piece.taggings.create(user_id: current_user.id, tag_id: tag.id)
    end

    if @piece.update(piece_params)
      redirect_to @piece, notice: 'Piece was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @piece.destroy
    redirect_to pieces_url, notice: 'Piece was successfully destroyed.'
  end

  def delete_image
    attachment = ActiveStorage::Attachment.find(params[:image_id])
    attachment.purge
    redirect_back(fallback_location: new_piece_path)
  end

  private

  def set_piece
    @piece = current_user.pieces.find(params[:id])
  end

  def piece_params
    params.require(:piece).permit(:name, :tags, images: [])
  end
end
