class FavoritesController < ApplicationController
  before_action :authorize!
  def index
    @favorites = Favorite.all
  end

  def create
    favorite = Favorite.new({name: params[:name],
                             url: params[:url],
                             address: params[:address],
                             city: params[:city],
                             zip: params[:zip],
                             state: params[:state]})
    if favorite.save
      flash[:message] = "#{favorite.name} added to your meetups!"
      render :nothing => true
    else
      flash[:error] = "You've already added #{favorite.name} to your meetups!"
      render :nothing => true
    end
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    redirect_to favorites_path
  end
end
