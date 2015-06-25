class FavoritesController < ApplicationController
  before_action :authorize!
  respond_to :json

  def index
    @favorites = Favorite.all
  end

  def create
    favorite = Favorite.new({name: params[:name],
                             url: params[:url],
                             address: params[:address],
                             city: params[:city],
                             zip: params[:zip],
                             state: params[:state],
                             user_id: current_user.id})
    if favorite.save
      @message = {message: "#{favorite.name} added to your favorites!"}
    else
      @message = {message: "You've already added #{favorite.name} to your favorites!"}
    end
    respond_with @message, status: 201, location: favorites_path
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    redirect_to favorites_path
  end
end
