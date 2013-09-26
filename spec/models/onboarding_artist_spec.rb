require 'spec_helper'

describe OnboardingArtist do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:onboarding_artist).should be_valid
  end
  it "is invalid without a signin_name" do
    FactoryGirl.build(:onboarding_artist, signin_name: nil).should_not be_valid
  end
  it "is invalid without a password" do
    FactoryGirl.build(:onboarding_artist, password_digest: nil).should_not be_valid
  end
end
