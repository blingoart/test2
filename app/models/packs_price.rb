class PacksPrice < ActiveRecord::Base

  belongs_to :pack
  has_many :downloads

  attr_accessible :end_date, :price, :start_date

end
