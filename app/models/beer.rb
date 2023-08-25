class Beer < ApplicationRecord
  belongs_to :brewery

  def self.beers_on_tap 
    Beer.where("on_tap = ?", true)
  end
end