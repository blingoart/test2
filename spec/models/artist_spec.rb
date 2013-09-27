# == Schema Information
#
# Table name: artists
#
#  id                    :integer          not null, primary key
#  first_name            :string(255)
#  last_name             :string(255)
#  percentage_of_revenue :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe Artist do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:artist).should be_valid
  end
  it "is invalid without a first_name" do
    FactoryGirl.build(:artist, first_name: nil).should_not be_valid
  end
  it "is invalid without a last_name" do
    FactoryGirl.build(:artist, last_name: nil).should_not be_valid
  end
  it "is invalid without a percentage_pf_revenue" do
    FactoryGirl.build(:artist, percentage_of_revenue: nil).should_not be_valid
  end
end
