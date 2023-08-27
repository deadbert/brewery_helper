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
end