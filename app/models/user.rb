class User < ActiveRecord::Base
  include RatingsAverage
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :beer_clubs, through: :memberships

  validates :username, uniqueness: true,
            length: { minimum: 3 },
            length: { maximum: 15 }

end
