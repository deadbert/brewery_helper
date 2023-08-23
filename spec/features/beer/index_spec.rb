require 'rails_helper'

RSpec.describe "Beer Index", type: :feature do
  describe "As a user" do
    describe "When I visit /beer" do
      it "I see a all the entries for beer's and their attributes" do
        beer_1 = Beer.create(type: "Lager", on_tap: true, pint_price: 6.00, b)
      end
    end
  end
end