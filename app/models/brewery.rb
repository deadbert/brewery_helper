class Brewery < ApplicationRecord
  has_many :beers

  def beers_count
    self.beers.count
  end

  def self.order_by
    Brewery.order("created_at DESC")
  end
end