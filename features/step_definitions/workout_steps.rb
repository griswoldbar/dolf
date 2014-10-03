Given(/^(\d+) workouts exists$/) do |n|
  @workouts = n.to_i.times.map { FactoryGirl.create(:workout_with_drill) }
end

Given(/^the workout: "(.*?)" exists$/) do |name|
  create(name.gsub(" ", "_").to_sym)
end