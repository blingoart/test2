require 'spec_helper'

describe Tag do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:tag).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:tag, name: nil).should_not be_valid
  end
end
