Then /^show me the page$/ do
  save_and_open_page
end

Given(/^I am on the home page$/) do
  visit root_path
end

Given(/^I navigate to the workouts page$/) do
  pending
end