class Pack < ActiveRecord::Base

  has_and_belongs_to_many :artists
  has_and_belongs_to_many :brands
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :apps
  has_and_belongs_to_many :stickers
  has_many :packs_prices
  has_many :downloads

  attr_accessible :available, :cover_image, :price, :title

  validates :title, :presence => true
  validates :price, :presence => true
  validates :available, :presence => true

end
