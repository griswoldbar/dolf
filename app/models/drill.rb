class Drill < ActiveRecord::Base
  has_and_belongs_to_many :workouts
  belongs_to :exercise
  has_many :drill_sessions

  def exercise_name=(name)
    self.exercise = Exercise.find_by_name(name)
  end
end