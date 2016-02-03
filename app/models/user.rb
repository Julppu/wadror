class User < ActiveRecord::Base
  include RatingsAverage
  has_many :ratings

  validates :username, uniqueness: true,
            length: { minimum: 3 },
            length: { maximum: 15 }

end
