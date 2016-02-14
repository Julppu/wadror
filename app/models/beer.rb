class Beer < ActiveRecord::Base
  include RatingsAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true, length: { minimum: 1 }
  validates :style, presence: true

  def to_s
    "#{self.name} from the brewery #{self.brewery.name}"
  end
end