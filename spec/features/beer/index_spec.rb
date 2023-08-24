require 'rails_helper'

RSpec.describe "Beer Index", type: :feature do
  describe "As a user" do
    describe "When I visit /beers" do
      it "I see all the entries for beer's and their attributes" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')

        visit "/beers"

        expect(page).to have_content("Lager")
        expect(page).to have_content(true)
        expect(page).to have_content(6.00)
        expect(page).to have_content("willy")
      end
    end
  end
end