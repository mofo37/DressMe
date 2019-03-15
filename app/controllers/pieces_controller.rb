class PiecesController < ApplicationController
  before_action :authorize
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = current_user.pieces
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit
  end

  # POST /pieces
  # POST /pieces.json
  def create

    tags = params[:tags]
    @piece = current_user.pieces.new(piece_params)

    respond_to do |format|
      if @piece.save
        tags.split(',').each do |tag_name|
          tag = Tag.find_or_create_by(name: tag_name.strip)
          @piece.taggings.create(user_id: current_user.id, tag_id: tag.id)
        end
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO make tagging on update and create more idiomatic
  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update

    tags = params[:tags]
    @piece.taggings.destroy_all

    tags.split(',').each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      @piece.taggings.create(user_id: current_user.id, tag_id: tag.id)
    end

    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    attachment = ActiveStorage::Attachment.find(params[:image_id])
    attachment.purge
    redirect_back(fallback_location: new_piece_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @piece = current_user.pieces.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piece_params
      params.require(:piece).permit(:name, :tags, images: [])
    end
end
