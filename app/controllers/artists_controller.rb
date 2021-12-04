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

  def artist_params
    params.permit(:name)
  end

end
