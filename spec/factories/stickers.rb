# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sticker do
    artist_id 1
    brand_id 1
    file_name "myimagefile.png"
    available true
  end
end
