class WorkoutBuilder
  def build_set(attribute_set)
    attribute_set.map &method(:build)
  end

  def build(attributes)
    attributes.symbolize_keys!
    workout = Workout.new(name: attributes[:name])
    workout.drills = attributes[:drills_attributes].map &method(:fetch_or_build_drill)
    workout.save!
  end

  private
  def fetch_or_build_drill(attributes)
    attributes.symbolize_keys!
    exercise_name = attributes[:exercise_name]
    max_reps = attributes[:max_reps]
    min_reps = attributes[:min_reps]
    exercise_id = Exercise.find_by_name(exercise_name).id
    Drill.find_or_create_by(max_reps: max_reps, min_reps: min_reps, exercise_id: exercise_id)
  end
end