require 'rails_helper'

RSpec.describe 'Beer Show' do
  describe "As a visitor" do
    describe "When I visit 'beers/:id" do
      it "Then I see the beer with that id including that beers attributes" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')
        visit "beers/#{beer_1.id}"

        expect(page).to have_content(beer_1.style)
        expect(page).to have_content(beer_1.on_tap)
        expect(page).to have_content(beer_1.pint_price)
        expect(page).to have_content(brewer.name)
      end

      it "I see a link to the beers and breweries index" do
        visit '/beers'
        
        expect(page).to have_link(href: '/beers')
        expect(page).to have_link(href: '/breweries')
      end

      it "I see a link to Delete the beer, when I click delete I'm redirected to /beers" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')
        visit "beers/#{beer_1.id}"

        expect(page).to have_selector("input[type=submit][value='Delete']")

        click_button "Delete"

        expect(page).not_to have_content(beer_1.name)
      end
    end
  end
end