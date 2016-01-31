class Brewery < ActiveRecord::Base
  include RatingsAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

end
