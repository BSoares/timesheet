FactoryGirl.define do
  factory :employee do
    sequence(:cpf) { CPF.generate(true) }
    sequence(:name) { |n| "Grusteniak #{n}o Ektvadzen" }

    trait :with_attendances do
      after(:create) do |employee|
        Timecop.travel Time.new(1985, 10, 19) do
          employee.attendances << create(:attendance, :completed)
        end
        Timecop.travel Time.new(1985, 10, 20) do
          employee.attendances << create(:attendance)
        end
        Timecop.travel Time.new(1985, 10, 21) do
          employee.attendances << create(:attendance, :completed)
        end
      end
    end
  end
end
