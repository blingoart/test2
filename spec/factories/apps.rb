# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    client_id 1
    name "Live"
    api_password "test"
    thumbnail_sticker_width 30
    thumbnail_sticker_height 30
    actual_sticker_width 60
    actual_sticker_height 60
    percentage_of_revenue 30
  end
end
