# == Schema Information
#
# Table name: stickers
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  brand_id   :integer
#  file_name  :string(255)
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
