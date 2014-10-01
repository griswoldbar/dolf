class AddForeignKeys < ActiveRecord::Migration
  def up
    add_foreign_key :muscles, :zones, column: :zone_id
    add_foreign_key :exercises_muscles, :muscles, column: :muscle_id
    add_foreign_key :exercises_muscles, :exercises, column: :exercise_id
    add_foreign_key :drills, :workouts, column: :workout_id
    add_foreign_key :drills, :exercises, column: :exercise_id
    add_foreign_key :workout_sessions, :workouts, column: :workout_id
    add_foreign_key :drill_sessions, :workout_sessions, column: :workout_session_id
    add_foreign_key :drill_sessions, :drills, column: :drill_id
  end

  def down
    remove_foreign_key :muscles, :zones
    remove_foreign_key :exercises_muscles, :muscles
    remove_foreign_key :exercises_muscles, :exercises
    remove_foreign_key :drills, :workouts
    remove_foreign_key :drills, :exercises
    remove_foreign_key :workout_sessions, :workouts
    remove_foreign_key :drill_sessions, :workout_sessions
    remove_foreign_key :drill_sessions, :drills
  end
end


