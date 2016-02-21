class Beer < ActiveRecord::Base
  include RatingsAverage
  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true, length: { minimum: 1 }
  validates :style, presence: true, length: { minimum: 1 }

  def to_s
    "#{self.name} from the brewery #{self.brewery.name}"
  end
end