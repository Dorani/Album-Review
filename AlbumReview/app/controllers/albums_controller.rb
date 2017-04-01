class AlbumsController < ApplicationController
  def index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :author)
  end
end
