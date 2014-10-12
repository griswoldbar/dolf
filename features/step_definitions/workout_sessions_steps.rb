Given(/^I have never done a workout$/) do
  expect(WorkoutSession.count).to eq(0)
end

When(/^I try to create a new workout session$/) do
  visit root_path
  click_link("new workout session")
end

Then(/^I should be given a choice of available workouts$/) do
  Workout.all.each do |workout|
    expect(page).to have_content workout.name
  end
end

Given(/^I create a workout session based on the #{capture_model}$/) do |name|
  workout_name = model!(name).name
  expect {
    select workout_name, from: "workout_session[workout_id]"
    click_button "Create Workout session"
  }.to change(WorkoutSession, :count).by (1)
  @workout_session = WorkoutSession.last
end

When(/^I take the workout: \"(.*?)\"(?: again)?$/) do |name|
  step %Q{I try to create a new workout session}
  step %Q{I create a workout session based on the workout: "#{name}"}
  click_link("Start")
end

Then(/^I should see the new workout session details$/) do
  @drill_sessions = @workout_session.drill_sessions
  expect(@drill_sessions).not_to be_empty
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

Then(/^I should see the first drill$/) do
  @current_drill_session = @workout_session.first_drill_session
  expect(page).to have_content(@current_drill_session.target_weight)
  expect(page).to have_content(@current_drill_session.target_reps)
  expect(page).to have_content(@current_drill_session.exercise.name)
end

When(/^I fill in my results with weight: (\d+.?\d?), reps: (\d+)$/) do |weight, reps|
  fill_in 'drill_session[weight]', with: weight
  fill_in 'drill_session[reps]', with: reps
  @expected_results ||= []
  @expected_results << {weight: weight, reps: reps}
end

When(/^I fill in my results$/) do
  @weight ||= random_weight
  @reps ||= random_reps
  step %{I fill in my results with weight: #{@weight}, reps: #{@reps}}
end

When(/^I ask for the next drill$/) do
  click_button("Next")
end

When(/^I complete the workout$/) do
  click_button("Next")
end

Then(/^I should see my results$/) do
  @expected_results.each do |result|
    expect(page).to have_content(result[:weight])
    expect(page).to have_content(result[:reps])
  end
end

Then(/^I should not be able to start the workout again$/) do
  expect(page).not_to have_link("Start")
end

When(/^I achieve (\d+) reps$/) do |reps|
  @weight = @current_drill_session.target_weight
  @reps = reps
  step %{I fill in my results with weight: #{@weight}, reps: #{@reps}}
  click_button("Next")
end

Then(/^the target weight should be (.*?)$/) do |change|
  target = page.body.match(/Weight: (?<target>\d+)/)[:target].to_i #wrong!! needs to be weight
  case change
  when "greater"
    expect(target).to be > (@weight)
  when "less"
    expect(target).to be < (@weight)
  when "the same"
    expect(target).to eq(@weight)
  end
end

When(/^I complete the rest of the workout$/) do
  while page.has_content?("Next")
    click_button("Next")
  end
end

Then(/^the target reps should be (\d+)$/) do |target_reps|
  expect(page).to have_content("Reps Target: #{target_reps}")
end

Given(/^I take the #{capture_model} and achieve:$/) do |workout, table|
  step %Q{I take the #{workout}}
  table.hashes.each do |result|
    step %Q{I fill in my results with weight: #{result[:weight]}, reps: #{result[:reps]}}
    step %Q{I ask for the next drill}
  end
end

When(/^I go to my workouts$/) do
  click_link("My Workouts")
end