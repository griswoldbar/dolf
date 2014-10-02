class TargetCalculator
  def initialize(new_session, old_session)
    @new_session = new_session
    @old_session = old_session
  end

  def weight
    default_weight
  end

  def reps
    @new_session.min_reps
  end

  private
  def default_weight
    Dolf.config["starting_weight"]
  end
end