FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "John #{n}" }
    sequence(:email) { |n| "john#{n}@bio.com" }
    password "12345678"
    password_confirmation "12345678"
  end
end
