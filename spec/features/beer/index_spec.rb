require 'rails_helper'

RSpec.describe "Beer Index", type: :feature do
  describe "As a user" do
    describe "When I visit /beers" do
      it "I see all the entries for beer's and their attributes" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')

        visit '/beers'

        expect(page).to have_content("Lager")
        expect(page).to have_content(true)
        expect(page).to have_content(6.00)
        expect(page).to have_content("willy")
      end

      it "I see a link to the beers and breweries index" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')

        visit '/beers'
        
        expect(page).to have_link(href: '/beers')
        expect(page).to have_link(href: '/breweries')
      end

      it "only shows beers that have a value of true for being on_tap" do
        brewer = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        brewer.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')
        brewer.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: 'Juicy bits')
        brewer.beers.create(style: 'Experimental', on_tap: false, pint_price: 10.00, name: 'Crazy Dazy')

        visit "/beers"

        expect(page).to have_content("Juicy bits")
        expect(page).not_to have_content("Crazy Dazy")
      end

      it "I see a link to edit each beer that links to /beers/:id/edit" do
        brewer_2 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewer_2.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')
        beer_2 = brewer_2.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: 'Juicy bits')
        beer_3 = brewer_2.beers.create(style: 'Experimental', on_tap: true, pint_price: 10.00, name: 'Crazy Dazy')

        visit '/beers'

        expect(page).to have_link(href: "/beers/#{beer_1.id}/edit")
        expect(page).to have_link(href: "/beers/#{beer_2.id}/edit")
        expect(page).to have_link(href: "/beers/#{beer_3.id}/edit")
      end

      it "I see a button to delete the beer next to each entry" do
        brewer_2 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
        beer_1 = brewer_2.beers.create(style: 'Lager', on_tap: true, pint_price: 6.00, name: 'willy')
        visit "/beers"

        expect(page).to have_selector("input[type=submit][value='Delete']")
        click_button 'Delete'

        expect(page).to_not have_content(beer_1.name)
      end
    end
  end
end