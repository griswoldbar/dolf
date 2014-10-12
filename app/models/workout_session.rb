class WorkoutSession < ActiveRecord::Base
  belongs_to :workout
  has_many :drill_sessions

  class << self
    def previous(other)
      order('created_at ASC').
      where(%Q{workout_id = ? and created_at < ?}, other.workout_id, other.created_at).
      last
    end
  end

  def first_drill_session
    drill_sessions.joins(:drill).where('drills.position = 1').first
  end

  def complete?
    drill_sessions.all?(&:complete?)
  end

  def relative_score
    previous ? absolute_score - previous.absolute_score : 0
  end

  def absolute_score
    drill_sessions.inject(0) {|total,ds| total + (ds.reps * ds.weight) }
  end

  private
  def previous
    WorkoutSession.previous(self)
  end
end