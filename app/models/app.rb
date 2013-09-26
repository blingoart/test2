class App < ActiveRecord::Base

  belongs_to :client
  has_and_belongs_to_many :packs
  has_many :downloads

  attr_accessible :actual_sticker_height, :actual_sticker_width, :api_password, :name, :percentage_of_revenue, :thumbnail_sticker_height, :thumbnail_sticker_width

  validates :client_id, :presence => true
  validates :name, :presence => true
  validates :api_password, :presence => true
  validates :percentage_of_revenue, :presence => true


end
