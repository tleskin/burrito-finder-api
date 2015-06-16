class FavoritesController < ApplicationController
  before_action :authorize!
  def index
    @burritos = [{name: "Chipotle", location: "Denver"}, {name: "Illegal Petes", location: "Boulder"}]
  end
end
