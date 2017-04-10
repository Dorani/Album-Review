class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order("created_at DESC")
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :author)
  end
end
