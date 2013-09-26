require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the Onboarding::FilesHelper. For example:
#
# describe Onboarding::FilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe Onboarding::ImagesHelper do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should return the linked image tag" do
    expect(helper.show_files(FactoryGirl.create(:onboarding_image), '/onboarding/14/edit/johnsmith', 'small')).to eq('<a href="/onboarding/14/edit/johnsmith"><img alt="Test" class="onboarding-image" height="200" src="/uploads/1/test.jpg" /></a>')
  end

end
