class Drill < ActiveRecord::Base
  belongs_to :workout
  acts_as_sequenced scope: :workout_id, column: :position

  belongs_to :exercise
  has_many :drill_sessions

  delegate :name, :muscles_list, to: :exercise

  def exercise_name=(exercise_name)
    self.exercise = Exercise.find_or_create_by(name: exercise_name)
  end

end