class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order("created_at DESC")
  end
  
  def show
    @brewery = Brewery.find(params[:id])
    @count = @brewery.beers_count
  end

  def show_beers
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

end
