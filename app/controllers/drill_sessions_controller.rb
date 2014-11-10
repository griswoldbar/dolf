class DrillSessionsController < ApplicationController

  def edit
    @drill_session = drill_sessions.find(params[:id])
    @siblings ||= (DrillSession.where(drill: @drill_session.drill) || [])
  end

  def update
    @drill_session = DrillSession.find(params[:id])
    @drill_session.update(drill_session_params)
    redirect_to next_drill_session_or_workout_session
  end

  private

  def drill_sessions
    DrillSession.includes(drill: :exercise)
  end

  def next_drill_session_or_workout_session
    next_ds = DrillSession.next_drill_session(@drill_session).first

    if next_ds
      edit_drill_session_path(next_ds)
    else
      @drill_session.workout_session
    end
  end

  def drill_session_params
    params.require(:drill_session).permit(:weight, :reps)
  end
end