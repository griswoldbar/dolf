class WorkoutSessionsController < ApplicationController

  def new
    @workout_session = WorkoutSession.new
  end
end