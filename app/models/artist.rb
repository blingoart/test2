class Artist < ActiveRecord::Base

  has_many :stickers
  has_many :brands, :through => :stickers
  has_and_belongs_to_many :packs
  has_and_belongs_to_many :tags

  attr_accessible :first_name, :last_name, :password, :password_confirmation, :percentage_of_revenue

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :percentage_of_revenue, :presence => true

end
