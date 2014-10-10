FactoryGirl.define do
  factory :workout do
    sequence(:name) { |n| "workout-#{n}" }

    # factory :workout_with_drill do
    #   after(:create) do |workout, e|
    #     create(:drill, workouts: [workout], position: 0)
    #   end
    # end

    # factory :super_workout do
    #   name "super workout"
    #
    #   after(:create) do |workout, e|
    #     create(:drill,
    #       workouts: [workout],
    #       position: 0,
    #       min_reps: 3,
    #       max_reps: 7,
    #       exercise: create(:exercise, name: "torture"))
    #     create(:drill,
    #       workouts: [workout],
    #       position: 1,
    #       min_reps: 5,
    #       max_reps: 15,
    #       exercise: create(:exercise, name: "agony"))
    #   end
    # end

  end
end