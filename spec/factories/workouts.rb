FactoryGirl.define do
  factory :workout do
    sequence(:name) { |n| "workout-#{n}" }

    ignore do
      drills_count 2
    end

    after(:create) do |workout, e|
      create_list(:drill, e.drills_count, workouts: [workout])
    end
  end
end