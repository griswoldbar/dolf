class DrillSession < ActiveRecord::Base
  belongs_to :workout_session
  belongs_to :drill
  delegate :name, :min_reps, :max_reps, :muscles_list, :exercise, to: :drill
  scope :complete, -> { where('weight is not null') }
  scope :next_drill_session, ->(ds) { joins('inner join drills on drills.id = drill_sessions.drill_id').where(workout_session_id: ds.workout_session_id).where('drills.position = ?', ds.position + 1)
  }

  def position
    drill.position
  end

  def target_reps
    target_calculator.reps
  end

  def target_weight
    target_calculator.weight
  end

  private
  def previous_session
    @previous_session ||= DrillSession.complete.where(drill: self.drill).includes(:drill).last
  end

  def target_calculator
    @target_calculator ||= TargetCalculator.new(self, previous_session)
  end
end

