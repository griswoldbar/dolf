class Drill < ActiveRecord::Base
  has_and_belongs_to_many :workouts
  belongs_to :exercise
  has_many :drill_sessions

  delegate :name, :muscles_list, to: :exercise

end