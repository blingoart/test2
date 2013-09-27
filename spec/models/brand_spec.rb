# == Schema Information
#
# Table name: brands
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  threshold_1       :integer
#  threshold_1_price :integer
#  threshold_2       :integer
#  threshold_2_price :integer
#  threshold_3       :integer
#  threshold_3_price :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Brand do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:brand).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:brand, name: nil).should_not be_valid
  end
  it "is invalid without a threshold_1" do
    FactoryGirl.build(:brand, threshold_1: nil).should_not be_valid
  end
  it "is invalid without a threshold_1_price" do
    FactoryGirl.build(:brand, threshold_1_price: nil).should_not be_valid
  end
end
