require 'rails_helper'

RSpec.describe "Beer Index", type: :feature do
  describe "As a user" do
    describe "When I visit /beer" do
      it "I see a all the entries for beer's and their attributes" do
        beer_1 = Beer.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')

        visit "/beer"
        save_and_open_page
        
        expect(page).to have_content(beer_1.style)
        expect(page).to have_content(beer_1.on_tap)
        expect(page).to have_content(beer_1.pint_price)
        expect(page).to have_content(beer_1.name)
      end
    end
  end
end