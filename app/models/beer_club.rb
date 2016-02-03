class BeerClub < ActiveRecord::Base
  has_many :members, -> { uniq }, source: :user
end
