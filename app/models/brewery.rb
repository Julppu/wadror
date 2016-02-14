class Brewery < ActiveRecord::Base
  include RatingsAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                   less_than_or_equal_to: Proc.new {Time.now.year} }
  validates :name, presence: true

  def to_s
    "#{self.name}, founded #{self.year}"
  end
end
