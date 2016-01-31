module RatingsAverage
  extend ActiveSupport::Concern

  def average_rating
    avg = 0.0
    self.ratings.each do |rating|
      avg += rating.score
    end
    avg / self.ratings.size
  end
end