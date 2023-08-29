require 'rails_helper'

RSpec.describe "Show Breweries Beers" do
  describe "As a user" do
    describe "when I visit /breweries/:id/beers" do
      it "displays the beers for the brewery in alphabetical order if I click the alphabetize link" do
        @brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        @beer_1 = @brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'Willy')
        @beer_2 = @brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'Clark')
        @beer_3 = @brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'Anderson Ale')

        visit "/breweries/#{@brewer.id}/beers"

        expect(@beer_1.name).to appear_before(@beer_3.name)
        expect(@beer_1.name).to appear_before(@beer_2.name)
        expect(@beer_2.name).to appear_before(@beer_3.name)

        click_link(href: "/breweries/#{@brewer.id}/beers?sorted=true")

        expect(@beer_3.name).to appear_before(@beer_2.name)
        expect(@beer_3.name).to appear_before(@beer_1.name)
        expect(@beer_2.name).to appear_before(@beer_1.name)
      end
    end
  end
end