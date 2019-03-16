class ClosetController < ApplicationController
  before_action :authorize

  def index
    @items = [current_user.pieces, current_user.outfits].flatten
  end
end
