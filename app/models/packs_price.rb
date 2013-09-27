# == Schema Information
#
# Table name: packs_prices
#
#  id         :integer          not null, primary key
#  pack_id    :integer
#  price      :decimal(8, 2)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PacksPrice < ActiveRecord::Base

  belongs_to :pack
  has_many :downloads

  attr_accessible :end_date, :price, :start_date

end
