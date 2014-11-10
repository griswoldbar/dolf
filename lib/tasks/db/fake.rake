module Faker
  module_function

  WEIGHTS = [5, 7.5, 10, 12.5, 15, 17.5, 20]
  def generate(offset)
    Workout.all.map {|workout| generate_workout_session(workout, offset)}
  end

  def generate_workout_session(workout, offset)
    workout_session = WorkoutSession.create(workout: workout)
    workout_session.update_attributes(created_at: Time.now + offset.days)
    drill_sessions = workout.drills.map {|drill| DrillSession.new(workout_session: workout_session, drill: drill)}
    drill_sessions.each {|drill_session| fake_drill_session(drill_session)}
  end

  def fake_drill_session(drill_session)
    drill_session.weight = WEIGHTS.sample
    drill_session.reps = (4..20).to_a.sample
    drill_session.save!
  end
end

namespace :db do
  desc "add fake data"
  task :fake do
    20.times { |n| Faker.generate(n) }
  end
end