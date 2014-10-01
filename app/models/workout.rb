class Workout < ActiveRecord::Base
  has_many :drills
  has_many :workout_sessions
end