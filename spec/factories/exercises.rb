FactoryGirl.define do
  factory :exercise do
    sequence(:name) { |n| "exercise-#{n}" }
    ignore { muscles_count 0 }

    after(:create) do |exercise, e|
      create_list(:muscle, e.muscles_count, exercises: [exercise])
    end
  end
end