require 'spec_helper'

describe Client do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:client).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:client, name: nil).should_not be_valid
  end
end
