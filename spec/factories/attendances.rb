FactoryGirl.define do
  factory :attendance do
    association :employee, factory: :employee
    sequence(:day) { DateTime.now.to_date }
    sequence(:entrance_at) { DateTime.now.change(hour: 8, min: 0, sec: 0) }

    trait :completed do
      sequence(:departure_at) { DateTime.now.change(hour: 17, min: 0, sec: 0) }
    end
  end
end
