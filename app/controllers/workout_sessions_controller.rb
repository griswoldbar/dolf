class WorkoutSessionsController < ApplicationController
  def new
    @workouts ||= Workout.all.includes(drills: {exercise: {muscles: :zone}})
    @workout_session = WorkoutSession.new
  end

  def create
    @workout = Workout.find(params[:workout_session][:workout_id])
    @workout_session = WorkoutSession.create(workout: @workout)
    @workout.drills.each { |drill| DrillSession.create(workout_session: @workout_session, drill: drill) }
    redirect_to @workout_session
  end

  def show
    @workout_session = WorkoutSession.find(params[:id])
    @drill_sessions = DrillSession.where(workout_session: @workout_session).includes(:drill)
    @workout = @workout_session.workout
  end
end