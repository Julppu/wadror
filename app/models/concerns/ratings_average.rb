module RatingsAverage
  extend ActiveSupport::Concern

  def average_rating
    avg = 0.0
    self.ratings.each do |rating|
      avg += rating.score
    end
    round(avg / self.ratings.size)
  end

  # helper method to round numbers to max 1 decimal
  def round param
    number_with_precision param, precision: 1, strip_insignificant_zeros: true
  end
end