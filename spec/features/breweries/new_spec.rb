require 'rails_helper'

RSpec.describe "/breweries/create" do
  describe "As a visitor" do
    describe "When I visit /breweries/create" do
      it "I see a form to create new Brewery which creates new Brewery and takes me back to /Breweries" do
        visit "/breweries/new"
        
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