# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brand do
    name "Marvel"
    threshold_1 1000
    threshold_1_price "5.00"
    threshold_2 10000
    threshold_2_price "4.00"
    threshold_3 100000
    threshold_3_price "3.00"
  end
end
