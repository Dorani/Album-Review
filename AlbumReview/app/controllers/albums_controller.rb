class AlbumsController < ApplicationController
  def index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
  end
end
