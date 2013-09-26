# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :onboarding_artist do
    first_name "John"
    last_name "Smith"
    signin_name "johnsmith"
    password_digest "$2a$10$Ula1qV8HJqB7l1UBdDXcb.j1YoGTHwCQBKGi.EVPyr/UN3tdWP/Mu"
    licensing_permission false
  end
end
