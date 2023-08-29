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

  describe "order_by" do
    it "returns returns list of breweries ordered by most recently created" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      brewery_2 = Brewery.create(name: "New Belgium", location: "Fort Collins", total_taps: 18, allow_dogs: true)

      expect(Brewery.order_by).to eq([brewery_2, brewery_1])
    end
  end

  describe "cost_more_than" do
    it "returns all beers at a brewery that cost more than given value" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      beer_1 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Space Ghost")
      beer_2 = brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Juicy Bits")
      beer_3 = brewery_1.beers.create(style: 'IPA', on_tap: false, pint_price: 6.50, name: "Willy")

      expect(brewery_1.cost_more_than(7.00)).to eq([beer_1, beer_2])
    end
  end

  describe "order_by_total_beers" do
    it "returns all breweries ordered by highest count of beers" do
      brewery_1 = Brewery.create(name: "Weld Works", location: "Greeley", total_taps: 25, allow_dogs: true)
      brewery_2 = Brewery.create(name: "New Belgium", location: "Fort Collins", total_taps: 18, allow_dogs: true)
      brewery_3 = Brewery.create(name: "Zwei", location: "Fort Collins", total_taps: 12, allow_dogs: true)

      brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Space Ghost")
      brewery_1.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Juicy Bits")
      brewery_1.beers.create(style: 'IPA', on_tap: false, pint_price: 6.50, name: "Willy")

      brewery_2.beers.create(style: 'Amber', on_tap: true, pint_price: 6.50, name: "Fat Tire")
      brewery_2.beers.create(style: 'IPA', on_tap: true, pint_price: 7.50, name: "Voodo Ranger")

      brewery_3.beers.create(style: 'Dunkel', on_tap: true, pint_price: 6.50, name: "Dunkel")
      
      expect(Brewery.order_by_total_beers).to eq([brewery_1, brewery_2, brewery_3])
    end
  end
end