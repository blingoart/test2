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
