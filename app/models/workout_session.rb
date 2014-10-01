class WorkoutSession < ActiveRecord::Base
  belongs_to :workout
  has_many :drill_sessions
end