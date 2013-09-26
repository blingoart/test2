class Tag < ActiveRecord::Base

  has_and_belongs_to_many :packs
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :stickers

  attr_accessible :name

  validates :name, :presence => true

end
