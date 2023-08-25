class BeerController < ApplicationController
  def index
    @beers = Beer.beers_on_tap
  end

  def show
    @beer = Beer.find(params[:id])
    @brewer = Brewery.find(@beer.brewery_id)
  end

  def create
    @brewery = Brewery.find(params[:brewery_id])
    @brewery.beers.create(
      style: params[:type],
      on_tap: params[:on_tap],
      pint_price: params[:pint_price].to_f,
      name: params[:beer_name]
    )
    redirect_to "/breweries/#{@brewery.id}/beers"
  end

  def update
    Beer.find(params[:id]).update(
      style: params[:beer_type],
      on_tap: params[:on_tap],
      pint_price: params[:pint_price],
      name: params[:beer_name]
    )
    redirect_to "/beers/#{params[:id]}"
  end

  def new
    @brewery = Brewery.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end
end