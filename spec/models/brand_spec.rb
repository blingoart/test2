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
