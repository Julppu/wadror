class Brewery < ActiveRecord::Base
  include RatingsAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                   less_than_or_equal_to: Proc.new {Time.now.year} }
  validates :name, presence: true

  scope :active, -> { where active:true }
  scope :retired, -> { where active:[nil,false] }

  def self.top n
    sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.limit n
  end
end
