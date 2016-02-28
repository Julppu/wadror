class Style < ActiveRecord::Base
  has_many :beers, dependent: destroy

  validates :name, { presence: true }

  def self.top n
    sorted_by_rating_in_desc_order = Style.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.limit n
  end
end
