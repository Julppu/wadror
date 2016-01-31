class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def average_rating
    avg = 0.0
    self.ratings.each do |rating|
      avg += rating.score
    end
    avg / self.ratings.size
  end

  def to_s
    "#{self.name} from the brewery #{self.brewery.name}"
  end
end