class Brand < ActiveRecord::Base

  has_many :stickers
  has_many :artists, through: :stickers
  has_and_belongs_to_many :packs

  attr_accessible :name, :threshold_1, :threshold_1_price, :threshold_2, :threshold_2_price, :threshold_3, :threshold_3_price

  validates :name, :presence => true
  validates :threshold_1, :presence => true
  validates :threshold_1_price, :presence => true

end
