class MapsController < ApplicationController
  respond_to :json

  def index
  end

  def find_burritos(lat = params[:lat], lon = params[:lon])
    user = current_user ? true : false
    @burritos = YelpService.new.burritos(lat, lon, user)
    respond_with @burritos, status: 201, location: maps_path
  end

  def about
  end
end
