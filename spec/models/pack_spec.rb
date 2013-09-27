# == Schema Information
#
# Table name: packs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  price      :decimal(8, 2)
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Pack do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:pack).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:pack, title: nil).should_not be_valid
  end
  it "is invalid without a price" do
    FactoryGirl.build(:pack, price: nil).should_not be_valid
  end
  it "is invalid without available" do
    FactoryGirl.build(:pack, available: nil).should_not be_valid
  end
end
