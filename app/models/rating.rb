class Rating < ActiveRecord::Base
  belongs_to :beer

  def create
    raise
  end

  def to_s
    "#{self.beer.name}: #{self.score}"
  end
end
