class Download < ActiveRecord::Base

  belongs_to :pack
  belongs_to :packs_price
  belongs_to :app

  attr_accessible :app_percentage_of_revenue, :app_user_id, :artist_percentage_of_revenue, :pack_price

end
