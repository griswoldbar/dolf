module WorkoutHelpers

  # def add_workout(workout)
  #   @workouts ||= {}
  #   @workouts[workout.name] = workout
  # end

  def random_weight
    rand(5000..50000)
  end

  def random_reps
    rand(6..20)
  end

  def generate_workout_with_muscles(name, muscles)
    create(:workout, name: name, drills:
      muscles.each_slice(2).map do |muscles|
        create(:drill, exercise:
          create(:exercise, muscles: muscles))
      end
    )
  end

  def generate_workout_with_exercises(nam)

  end

  def generate_workout_with_zones

  end
end

World(WorkoutHelpers)