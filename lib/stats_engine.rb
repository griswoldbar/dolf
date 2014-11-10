class StatsEngine
  def initialize(workout_session_repo = WorkoutSession)
    @workout_sessions = workout_session_repo.all
  end

  def absolute_scores
    first_day = @workout_sessions.order(:created_at).first.created_at
    @workout_sessions.map {|ws| [ws.created_at - first_day, ws.absolute_score.to_f]}
  end
  
  def absolute_score_by_zone
    
  end
end