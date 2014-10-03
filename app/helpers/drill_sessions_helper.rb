module DrillSessionsHelper
  def weight_in_kg(weight)
    (weight.to_f / 1000).to_s + "kg"
  end

  def button_text
    "Next"
  end
end