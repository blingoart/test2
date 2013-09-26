# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :onboarding_image do
    onboarding_artist_id 1
    file_name File.open(File.join(Rails.root, '/public/uploads/1/test.jpg'))
  end

end
