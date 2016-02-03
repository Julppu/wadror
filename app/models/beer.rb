class Beer < ActiveRecord::Base
  include RatingsAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  validates :name, presence: true

  def to_s
    "#{self.name} from the brewery #{self.brewery.name}"
  end
end