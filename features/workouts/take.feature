Feature: Do a workout
  As a prospective jock
  In order to get fit
  I want to be able to create workout sessions based on workout patterns

  Background:
    Given I have never done a workout
    And the workout: "super workout" exists
    And the following drills exist:
    | workout                  |
    | workout: "super workout" |
    | workout: "super workout" |
    And another workout exists

  Scenario: User sets up his first workout
    Given another workout exists
    When I try to create a new workout session
      Then I should be given a choice of available workouts
    When I create a workout session based on the workout: "super workout"
      Then I should see the new workout session details
      And the target reps should be set to the minimum on each exercise
      And the weight should be set to the minimum on each exercise

  Scenario: User does a workout
    Given I take the workout: "super workout"
      Then I should see the first drill
    When I fill in my results
    And I ask for the next drill
    And I fill in my results
    And I complete the workout
      Then I should see my results
      And I should not be able to start the workout again
