FactoryGirl.define do
  factory :attendance do
    association :employee, factory: :employee
    day Date.new(1985, 10, 19)
    entrance_at DateTime.new(1985, 10, 19, 8, 0, 0)

    trait :completed do
      departure_at DateTime.new(1985, 10, 19, 17, 0, 0)
    end
  end
end
