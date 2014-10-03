class WorkoutSession < ActiveRecord::Base
  belongs_to :workout
  has_many :drill_sessions

  def first_drill_session
    drill_sessions.joins(:drill).where('drills.position = 0').first
  end
end