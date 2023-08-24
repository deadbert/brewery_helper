class BeerController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @brewer = Brewery.find(@beer.brewery_id)
  end
end