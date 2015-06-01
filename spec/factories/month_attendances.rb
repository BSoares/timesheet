FactoryGirl.define do
  factory :month_attendance do
    association :employee, factory: :employee
    sequence(:month) { DateTime.now.to_date }
  end
end
