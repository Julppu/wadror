class Brewery < ActiveRecord::Base
  include RatingsAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                   less_than_or_equal_to: Date.current.in_time_zone.year }
  validates :name, presence: true
end
