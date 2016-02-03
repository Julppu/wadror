class User < ActiveRecord::Base
  include RatingsAverage
  has_many :ratings
end
