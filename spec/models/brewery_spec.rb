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
end