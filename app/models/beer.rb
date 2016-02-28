class Beer < ActiveRecord::Base
  include RatingsAverage
  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true, length: { minimum: 1 }
  validates :style, presence: true

  def to_s
    "#{self.name} from the brewery #{self.brewery.name}"
  end

  def self.top n
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.limit n
  end
end