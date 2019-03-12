class TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def show
  end
end
