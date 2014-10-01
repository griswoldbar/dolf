Given(/^(\d+) workouts exists$/) do |n|
  n.to_i.times { FactoryGirl.create(:workout) }
end

When(/^I try to create a new workout session$/) do
  visit root_path
  click_link("new workout session")
end

Then(/^I am given a choice of available workouts$/) do
  pending # express the regexp above with the code you wish you had
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