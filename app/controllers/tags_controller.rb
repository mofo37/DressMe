class TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def show
    @tag = current_user.tags.find(params[:id])
  end
end
