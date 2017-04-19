class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy]
  def index
    if params[:category].blank?
      @albums = Album.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @albums = Album.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show

  end

  def new
    @album = current_user.albums.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @album = current_user.albums.build(album_params)
    @album.category_id = params[:category_id]

    if @album.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @album.category_id = params[:category_id]
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :author, :category_id, :album_img)
  end

  def find_album
    @album = Album.find(params[:id])
  end
end
