class User < ActiveRecord::Base
  include RatingsAverage
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  has_secure_password

  validates :username, uniqueness: true,
            length: { minimum: 3, maximum: 15 }
  validates :password,
            length: {minimum: 4},
            format: { with: /[A-Za-z]+[0-9]+/ }

  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    ratings.joins(:beer).group(:style_id).average(:score).max_by { |key, value| value }.first
  end

  def favorite_brewery
    return nil if ratings.empty?
    ratings.group_by { |rating| rating.beer.brewery }.map {
        |key, value| [key, sequence(value)]
    }.max_by { |key, value| value }.first
  end

  # helper method to calculate average of a subsequence of a map
  def sequence(sub_ratings)
    return nil if sub_ratings.empty?
    ratings.inject(0.0) { |sum, rating| sum + rating.score }.to_f / sub_ratings.count
  end
  
  def self.top n
    sorted_by_rating_in_desc_order = Brewery.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.limit n
  end
end
