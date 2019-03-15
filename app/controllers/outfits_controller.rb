class OutfitsController < ApplicationController
  before_action :authorize
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]

  # GET /outfits
  # GET /outfits.json
  def index
    @outfits = current_user.outfits
  end

  # GET /outfits/1
  # GET /outfits/1.json
  def show
  end

  # GET /outfits/new
  def new
    @outfit = Outfit.new
    @pieces = current_user.pieces
  end

  # GET /outfits/1/edit
  def edit
    @pieces = current_user.pieces
  end

  # POST /outfits
  # POST /outfits.json
  def create
    
    tags = params[:tags]
    @outfit = current_user.outfits.new(outfit_params)
    
    respond_to do |format|
      if @outfit.save

        tags.split(',').each do |tag|
          tag = Tag.find_or_create_by(name: tag_name.strip)
          @outfit.taggings.create(user_id: current_user.id, tag_id: tag.id)
        end
        
        format.html { redirect_to @outfit, notice: 'Outfit was successfully created.' }
        format.json { render :show, status: :created, location: @outfit }
      else
        format.html { render :new }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO make tagging on update and create more idiomatic
  # PATCH/PUT /outfits/1
  # PATCH/PUT /outfits/1.json
  def update
    tags = params[:tags]
    @outfit.taggings.destroy_all

    tags.split(',').each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      @outfit.taggings.create(user_id: current_user.id, tag_id: tag.id)
    end

    respond_to do |format|
      if @outfit.update(outfit_params)
        format.html { redirect_to @outfit, notice: 'Outfit was successfully updated.' }
        format.json { render :show, status: :ok, location: @outfit }
      else
        format.html { render :edit }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outfits/1
  # DELETE /outfits/1.json
  def destroy
    @outfit.destroy
    respond_to do |format|
      format.html { redirect_to outfits_url, notice: 'Outfit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    attachment = ActiveStorage::Attachment.find(params[:image_id])
    attachment.purge
    redirect_back(fallback_location: new_outfit_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outfit
      @outfit = current_user.outfits.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outfit_params
      params.require(:outfit).permit(:name, :formality, :work, :tags, piece_ids: [], images: [])
    end
end
