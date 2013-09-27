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

require 'spec_helper'

describe PacksPrice do
  pending "add some examples to (or delete) #{__FILE__}"
end
