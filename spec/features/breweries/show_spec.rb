require 'rails_helper'

RSpec.describe "Breweries Show" do
  describe "As a user" do
    describe "When I visit /breweries/:id" do
      it "I can see the parent entry and the parent entries attributes" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        visit "/breweries/#{brewery_1.id}"        

        expect(page).to have_content(brewery_1.name)
        expect(page).to have_content(brewery_1.location)
        expect(page).to have_content(brewery_1.total_taps)
        expect(page).to have_content(brewery_1.allow_dogs)
      end
    end

    describe "When I visit /breweries/:id/beers" do
      it "Then I see each beer that is associated with the brewery and the beers attributes" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewery_1.beers.create(style: "IPA", on_tap: true, pint_price: 7.50, name: "Juicy Bits")
        visit "/breweries/#{brewery_1.id}/beers"

        expect(page).to have_content(beer_1.style)
        expect(page).to have_content(beer_1.on_tap)
        expect(page).to have_content(beer_1.pint_price)
        expect(page).to have_content(beer_1.name)
      end
    end
  end
end