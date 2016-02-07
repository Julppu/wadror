class User < ActiveRecord::Base
  include RatingsAverage
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  has_secure_password

  validates :username, uniqueness: true,
            length: { minimum: 3 },
            length: { maximum: 15 }
end
