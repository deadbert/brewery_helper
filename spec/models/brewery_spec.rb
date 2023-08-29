require 'rails_helper'

RSpec.describe Brewery, type: :model do 
 describe "relationships" do 
   it { should have_many :beers }
 end

  describe "validations" do 
    it { should validate_presence_of :name} 
    it { should validate_presence_of :location } 
    it { should validate_presence_of :total_taps } 
    it { should allow_value(true).for(:allow_dogs) } 
    it { should allow_value(false).for(:allow_dogs) }
  end

  describe "#beers_count" do
    it "returns a count of the beers a brewery has" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      beer_1 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Space Ghost")
      beer_2 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Juicy Bits")
      beer_3 = brewery_1.beers.create(style: 'IPA', on_tap: false, pint_price: 6.50, name: "Willy")

      expect(brewery_1.beers_count).to eq(3)
    end
  end
end