Given(/^I have never done a workout$/) do
  expect(WorkoutSession.count).to eq(0)
end

When(/^I try to create a new workout session$/) do
  visit root_path
  click_link("new workout session")
end

Then(/^I should be given a choice of available workouts$/) do
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

Given(/^I have created a workout session based on the workout: "(.*?)"$/) do |name|
  step %Q{I try to create a new workout session}
  step %Q{I create a workout session based on the workout: "#{name}"}
end

Then(/^I should see the new workout session details$/) do
  @drill_sessions = @workout_session.drill_sessions
  @drill_sessions.each do |drill_session|
    expect(page).to have_content(drill_session.exercise.name)
    drill_session.exercise.muscles.each do |muscle|
      expect(page).to have_content(muscle.name)
    end
  end
end

Then(/^the target reps should be set to the minimum on each exercise$/) do
  @drill_sessions.each do |drill_session|
    expect(drill_session.target_reps).to eq(drill_session.drill.min_reps)
  end
end

Then(/^the weight should be set to the minimum on each exercise$/) do
  @drill_sessions.each do |drill_session|
    expect(drill_session.target_weight).to eq(Dolf.config["starting_weight"])
  end
end

When(/^I start the workout$/) do
  click_link("Start")
end

Then(/^I should see the first drill$/) do
  @current_drill_session = @workout_session.first_drill_session
  expect(page).to have_content(@current_drill_session.target_weight.to_f / 1000)
  expect(page).to have_content(@current_drill_session.target_reps)
  expect(page).to have_content(@current_drill_session.exercise.name)
end

When(/^I fill in my results with weight: (\d+), reps: (\d+)$/) do |weight, reps|
  fill_in 'drill_session[weight]', with: weight
  fill_in 'drill_session[reps]', with: reps
end

When(/^I ask for the next drill$/) do
  click_button("Next")
end

When(/^I complete the workout$/) do
  click_button("Next")
end

Then(/^I should see my results$/) do
  pending
end