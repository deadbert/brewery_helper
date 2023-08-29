require 'rails_helper'

RSpec.describe Beer, type: :model do 
 describe "relationships" do 
   it { should belong_to :brewery }
 end

  describe "validations" do 
    it { should validate_presence_of :style} 
    it { should validate_presence_of :pint_price} 
    it { should validate_presence_of :name } 
    it { should allow_value(true).for(:on_tap) } 
    it { should allow_value(false).for(:on_tap) }
  end

  describe "#beers_on_tap" do
    it "returns only beer objects that are on_tap = true" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      beer_1 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Space Ghost")
      beer_2 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Juicy Bits")
      beer_3 = brewery_1.beers.create(style: 'IPA', on_tap: false, pint_price: 6.50, name: "Willy")

      expect(Beer.beers_on_tap).to eq([beer_1, beer_2])
    end
  end
end