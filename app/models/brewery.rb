class Brewery < ApplicationRecord
  has_many :beers

  def beers_count
    self.beers.count
  end
end