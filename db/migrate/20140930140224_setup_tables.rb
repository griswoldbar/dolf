class SetupTables < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.timestamps
    end

    create_table :muscles do |t|
      t.string :name
      t.integer :zone_id
      t.timestamps
    end

    create_table :exercises do |t|
      t.string :name
      t.timestamps
    end

    create_table :muscles_exercises do |t|
      t.integer :muscle_id
      t.integer :exercise_id
      t.timestamps
    end

    create_table :workouts do |t|
      t.string :name
      t.timestamps
    end

    create_table :drills do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :max_reps
      t.integer :min_reps
      t.timestamps
    end

    create_table :workout_sessions do |t|
      t.integer :workout_id
      t.timestamps
    end

    create_table :drill_sessions do |t|
      t.integer :workout_session_id
      t.integer :drill_id
      t.integer :weight
      t.integer :reps
      t.timestamps
    end
  end
end
