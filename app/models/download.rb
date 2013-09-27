# == Schema Information
#
# Table name: downloads
#
#  id            :integer          not null, primary key
#  pack_id       :integer
#  app_id        :integer
#  pack_price_id :integer
#  app_user_id   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Download < ActiveRecord::Base

  belongs_to :pack
  belongs_to :packs_price
  belongs_to :app

  attr_accessible :app_percentage_of_revenue, :app_user_id, :artist_percentage_of_revenue, :pack_price

end
