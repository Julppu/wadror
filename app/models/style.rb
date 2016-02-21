class Style < ActiveRecord::Base
  has_many :beers, dependent: destroy

  validates :name, { presence: true }
end
