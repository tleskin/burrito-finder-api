class MapsController < ApplicationController
  before_action :authorize!
  respond_to :json

  def index
  end

  def find_burritos(lat = params[:lat], lon = params[:lon])
    @burritos = YelpService.new.burritos(lat, lon)
    respond_with @burritos, status: 201, location: maps_path
  end
end
