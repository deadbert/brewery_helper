require 'rails_helper'

RSpec.describe "Breweries Show" do
  describe "As a user" do
    describe "When I visit /breweries/:id" do
      it "I can see the parent entry and the parent entries attributes" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        visit "/brewery/#{brewery_1.id}"        

        expect(page).to have_content(brewery_1.name)
        expect(page).to have_content(brewery_1.location)
        expect(page).to have_content(brewery_1.total_taps)
        expect(page).to have_content(brewery_1.allow_dogs)
      end
    end
  end
end