# == Schema Information
#
# Table name: onboarding_artists
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  signin_name          :string(255)
#  password_digest      :string(255)
#  licensing_permission :datetime
#  bio                  :text
#  photo                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

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
