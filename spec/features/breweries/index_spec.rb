require 'rails_helper'

RSpec.describe "Breweries index", type: :feature do
  describe "As a user" do
    describe "When I visit /breweries" do
      it "I can see the name of each brewery in the system" do
        #arrange
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        brewery_2 = Brewery.create(name: "Maxline", location: "Fort Collins", total_taps: 12, allow_dogs: true)
        #act
        visit "/breweries"
        #assert
        expect(page).to have_content(brewery_1.name)
        expect(page).to have_content(brewery_2.name)
      end
    end
  end
end