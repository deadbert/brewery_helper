class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy

  validates_presence_of :name 
  validates_presence_of :location 
  validates_presence_of :total_taps 
  validates :allow_dogs, inclusion: [true, false] 

  def beers_count
    self.beers.count
  end

  def self.order_by
    Brewery.order("created_at DESC")
  end

  def ordered_beers
    self.beers.order('name')
  end

  def cost_more_than(float)
    self.beers.where('pint_price > ?', float)
  end

  def self.order_by_total_beers
    Brewery.joins(:beers).group(:id).order('COUNT(beers.brewery_id) DESC')
  end
end