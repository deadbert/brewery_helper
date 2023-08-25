require 'rails_helper'

RSpec.describe "/breweries/:id/beers/new" do
  describe "As a visitor" do
    describe "When I visit /breweries/:id/beers/new" do
      it "I see a form to create new Beer which creates new Beer and takes me back to /breweries/:id/beers" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        visit "/breweries/#{brewery_1.id}/beers/new"
        
        fill_in 'type', :with => 'IPA'
        fill_in 'on_tap', :with => 'true'
        fill_in 'pint_price', :with => '7.50'
        fill_in 'beer_name', :with => 'Juicy Bits'
        click_button 'Submit'

        expect(page).to have_content("Juicy Bits")
      end
    end
  end
end