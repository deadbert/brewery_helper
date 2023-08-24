class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.order_by
  end
  
  def show
    @brewery = Brewery.find(params[:id])
    @count = @brewery.beers_count
  end

  def show_beers
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

  def create
    Brewery.create(
      name: params[:brewery_name],
      location: params[:location],
      total_taps: params[:total_taps].to_i,
      allow_dogs: params[:allow_dogs]
    )
    redirect_to '/breweries'
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update(
      name: params[:brewery_name],
      location: params[:location],
      total_taps: params[:total_taps].to_i,
      allow_dogs: params[:allow_dogs]
    )
    redirect_to '/breweries'
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def new

  end
end
