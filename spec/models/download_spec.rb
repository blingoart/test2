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

require 'spec_helper'

describe Download do
  pending "add some examples to (or delete) #{__FILE__}"
end
