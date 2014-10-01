Given(/^(\d+) workouts exists$/) do |n|
  @workouts = n.to_i.times.map { FactoryGirl.create(:workout) }
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

Given(/^I create a workout session based on the workout: "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the new workout session$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the target reps is set to the minimum$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the weight is set to the minimum$/) do
  pending # express the regexp above with the code you wish you had
end