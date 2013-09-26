require 'spec_helper'

describe OnboardingImage do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:onboarding_image).should be_valid
  end
  it "is invalid without a file_name" do
    FactoryGirl.build(:onboarding_image, file_name: nil).should_not be_valid
  end
end
