require 'spec_helper'

describe Sticker do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:sticker).should be_valid
  end
  it "is invalid without either an artist_id or a brand_id" do
    FactoryGirl.build(:sticker, artist_id: nil, brand_id: nil).should_not be_valid
  end
  it "is valid with an artist_id" do
    FactoryGirl.build(:sticker, artist_id: 1).should be_valid
  end
  it "is valid with a brand_id" do
    FactoryGirl.build(:sticker, brand_id: 1).should be_valid
  end
  it "is valid with both an artist_id and an owner" do
    FactoryGirl.build(:sticker, artist_id: 1, brand_id: 1).should be_valid
  end
  it "is invalid without a file_name" do
    FactoryGirl.build(:sticker, file_name: nil).should_not be_valid
  end
  it "is invalid without available" do
    FactoryGirl.build(:sticker, available: nil).should_not be_valid
    end
end
