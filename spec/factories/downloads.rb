# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :download, :class => 'Downloads' do
    pack nil
    app nil
    app_user_id "MyString"
    pack_price "9.99"
    app_percentage_of_revenue 1
    artist_percentage_of_revenue 1
  end
end
