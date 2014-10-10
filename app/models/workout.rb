class Workout < ActiveRecord::Base
  has_many :drills
  has_many :workout_sessions, dependent: :destroy

  #rails' nested attributes doesn't seem to work with 'sequential' gem
  def drills_attributes=(collection)
    collection.each do |attrs|
      Drill.create(attrs.merge(workout: self))
    end
  end
end