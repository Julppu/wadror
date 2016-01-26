class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
    avg = 0.0
    self.ratings.each do |rating|
      avg += rating.score
    end
    avg / self.ratings.size
  end
end