class Sticker < ActiveRecord::Base

  belongs_to :artist
  belongs_to :brand
  has_and_belongs_to_many :packs
  has_and_belongs_to_many :tags

  attr_accessible :available, :file_name

  validates :artist_id, :presence => true, :unless => :brand_id?
  validates :brand_id, :presence => true, :unless => :artist_id?
  validates :file_name, :presence => true
  validates :available, :presence => true

end
