FactoryGirl.define do
  factory :month_attendance do
    association :employee, factory: [:employee, :with_attendances]
    sequence(:month) { DateTime.now.to_date }
  end
end
