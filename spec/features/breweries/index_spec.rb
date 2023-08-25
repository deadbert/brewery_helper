require 'rails_helper'

RSpec.describe "Breweries index", type: :feature do
  describe "As a user" do
    describe "When I visit /breweries" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      brewery_2 = Brewery.create(name: "Maxline", location: "Fort Collins", total_taps: 12, allow_dogs: true)
      it "I can see the name of each brewery in the system" do
        visit "/breweries"

        expect(page).to have_content(brewery_1.name)
        expect(page).to have_content(brewery_2.name)
      end

      it "Is ordered by most recently created Brewery fist" do
        brewery_3 = Brewery.create(name: "New Belgium", location: "Fort Collins", total_taps: 25, allow_dogs: true)
        brewery_4 = Brewery.create(name: "Prost", location: "Fort Collins", total_taps: 12, allow_dogs: true)
        visit "/breweries"

        expect(brewery_4.name).to appear_before(brewery_3.name)
      end

      it "I see a link to the beers and breweries index" do
        visit '/breweries'
        
        expect(page).to have_link(href: '/beers')
        expect(page).to have_link(href: '/breweries')
      end

      it "I see a link to add a new brewery" do
        visit "/breweries"

        expect(page).to have_link(href: "/breweries/new")
      end
    end
  end
end