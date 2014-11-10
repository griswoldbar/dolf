class StatsController < ApplicationController

  def absolute_scores
    render json: stats_engine.absolute_scores
  end

  def relative_scores

  end

  private
  def stats_engine
    StatsEngine.new
  end
end