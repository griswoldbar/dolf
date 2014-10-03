class Workout < ActiveRecord::Base
  has_and_belongs_to_many :drills
  has_many :workout_sessions, dependent: :destroy

  accepts_nested_attributes_for :drills
end