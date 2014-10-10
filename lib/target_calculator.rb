class TargetCalculator
  def initialize(new_session, old_session)
    if old_session
      raise "non-matching sessions" unless (new_session.drill_id == old_session.drill_id)
    end

    @drill = new_session.drill
    @new_session = new_session
    @old_session = old_session
  end

  def weight
    if @old_session
      calculation[:weight]
    else
      default_weight
    end
  end

  def reps
    if @old_session
      calculation[:reps]
    else
      @new_session.min_reps
    end
  end

  private
  def default_weight
    Dolf.config["starting_weight"]
  end

  def increment
    Dolf.config["weight_increment"]
  end

  def calculation
    @calculation ||= begin
      old_reps = @old_session.reps
      min_reps = @drill.min_reps
      max_reps = @drill.max_reps
      old_weight = @old_session.weight

      if (old_reps >= min_reps) && (old_reps < max_reps)
        reps = old_reps + 1
        weight = old_weight
      elsif (old_reps < min_reps)
        reps = min_reps
        weight = old_weight - increment
      else
        reps = min_reps
        weight = old_weight + increment
      end

      { weight: weight, reps: reps }
    end
  end
end