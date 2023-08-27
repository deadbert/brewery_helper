class Beer < ApplicationRecord
  belongs_to :brewery

  validates_presence_of :style
  validates_presence_of :pint_price
  validates_presence_of :name 
  validates :on_tap, inclusion: [true, false] 

  def self.beers_on_tap 
    Beer.where("on_tap = ?", true)
  end
end