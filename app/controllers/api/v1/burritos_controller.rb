class Api::V1::BurritosController < Api::V1::BaseController
  def index
    lat = params[:lat]
    lon = params[:lon]
    burritos = YelpService.new.burritos(lat, lon)
    respond_with burritos, json: burritos
  end
end
