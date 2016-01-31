class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def average_rating
    avg = 0.0
    self.ratings.each do |rating|
      avg += rating.score
    end
    avg / self.ratings.size
  end
end
