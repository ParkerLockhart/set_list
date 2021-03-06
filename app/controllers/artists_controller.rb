class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
    # Artist.create(name: params[:name])
    Artist.create(artist_params)
    @artist = Artist.last
    redirect_to "/artists/#{@artist.id}"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to "/artists/#{@artist.id}"
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end


private
  def artist_params
    params.permit(:name)
  end

end
