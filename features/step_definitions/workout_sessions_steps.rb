Given(/^(\d+) workouts exists$/) do |n|
  @workouts = n.to_i.times.map { FactoryGirl.create(:workout) }
end

Given(/^I have never done a workout$/) do
  expect(WorkoutSession.count).to eq(0)
end

When(/^I try to create a new workout session$/) do
  visit root_path
  click_link("new workout session")
end

Then(/^I am given a choice of available workouts$/) do
  @workouts.each do |workout|
    expect(page).to have_content workout.name
  end
end

Given(/^I create a workout session based on the workout: "(.*?)"$/) do |name|
  expect {
    select name, from: "workout_session[workout_id]"
    click_button "Create Workout session"
  }.to change(WorkoutSession, :count).by (1)
  @workout_session = WorkoutSession.last
end

Then(/^I see the new workout session details$/) do
  @drill_sessions = @workout_session.drill_sessions
  @drill_sessions.each do |drill_session|
    expect(page).to have_content(drill_session.exercise.name)
    drill_session.exercise.muscles.each do |muscle|
      expect(page).to have_content(muscle.name)
    end
  end
end

Then(/^the target reps is set to the minimum on each exercise$/) do
  @drill_sessions.each do |drill_session|
    expect(drill_session.target_reps).to eq(drill_session.drill.min_reps)
  end
end

Then(/^the weight is set to the minimum on each exercise$/) do
  @drill_sessions.each do |drill_session|
    expect(drill_session.target_weight).to eq(Dolf.config["starting_weight"])
  end
end