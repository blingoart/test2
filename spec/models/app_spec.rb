# == Schema Information
#
# Table name: apps
#
#  id                       :integer          not null, primary key
#  client_id                :integer
#  name                     :string(255)
#  api_password             :string(255)
#  thumbnail_sticker_width  :integer
#  thumbnail_sticker_height :integer
#  actual_sticker_width     :integer
#  actual_sticker_height    :integer
#  percentage_of_revenue    :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'spec_helper'

describe App do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:app).should be_valid
  end
  it "is invalid without a client_id" do
    FactoryGirl.build(:app, client_id: nil).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:app, name: nil).should_not be_valid
  end
  it "is invalid without an api_password" do
    FactoryGirl.build(:app, api_password: nil).should_not be_valid
  end
  it "is invalid without a percentage_pf_revenue" do
    FactoryGirl.build(:app, percentage_of_revenue: nil).should_not be_valid
  end
end
