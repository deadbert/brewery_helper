require 'rails_helper'

RSpec.describe "/beers/:id" do
  describe "As a visitor" do
    describe "When I visit /beers/:id/edit" do
      it "I see a form to update the Beer which edits the Beer and takes me back to /beers/:id" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewery_1.beers.create(style: "IPA", on_tap: true, pint_price: 7.50, name: "Juicy Bits")

        visit "/beers/#{beer_1.id}/edit"
        
        fill_in 'style', :with => 'IPA'
        fill_in 'on_tap', :with => 'true'
        fill_in 'pint_price', :with => '7.50'
        fill_in 'beer_name', :with => 'Space Cadet'
        click_button 'Submit'

        expect(page).to have_content("Space Cadet")
      end
    end
  end
end