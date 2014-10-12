class SetupTables < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.timestamps
    end

    create_table :muscles do |t|
      t.string :name
      t.integer :zone_id, null: false
      t.timestamps
    end

    create_table :exercises do |t|
      t.string :name
      t.timestamps
    end

    create_table :exercises_muscles, id: false do |t|
      t.integer :muscle_id, null: false
      t.integer :exercise_id, null: false
      t.timestamps
    end

    create_table :workouts do |t|
      t.string :name
      t.timestamps
    end

    create_table :drills do |t|
      t.integer :exercise_id, null: false
      t.integer :workout_id, null: false
      t.integer :max_reps
      t.integer :min_reps
      t.integer :position
      t.timestamps
    end

    create_table :workout_sessions do |t|
      t.integer :workout_id, null: false
      t.timestamps
    end

    create_table :drill_sessions do |t|
      t.integer :workout_session_id, null: false
      t.integer :drill_id, null: false
      t.decimal :weight, precision: 5, scale: 2
      t.integer :reps
      t.timestamps
    end
  end
end
