require 'rails_helper'

RSpec.describe "/breweries/:id/edit" do
  describe "As a visitor" do
    describe "When I visit /breweries/:id/edit" do
      it "I see a form to update the Brewery which edits Brewery and takes me back to /Breweries/:id" do
        brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        visit "/breweries/#{brewery_1.id}/edit"
        
        fill_in 'brewery_name', :with => 'New Belgium'
        fill_in 'location', :with => 'Fort Collins'
        fill_in 'total_taps', :with => '20'
        fill_in 'allow_dogs', :with => 'true'
        click_button 'Submit'

        expect(page).to have_content("New Belgium")
      end
    end
  end
end