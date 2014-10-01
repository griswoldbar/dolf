class Drill < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  has_many :drill_sessions

end