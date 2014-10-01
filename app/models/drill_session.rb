class DrillSession < ActiveRecord::Base
  belongs_to :workout_session
  belongs_to :drill
end