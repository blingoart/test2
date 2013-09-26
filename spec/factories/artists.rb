# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    first_name "John"
    last_name "Smith"
    percentage_of_revenue 60
  end
end
