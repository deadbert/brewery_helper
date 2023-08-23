class BeerController < ApplicationController
  def index
    @beers = Beer.all
  end
end