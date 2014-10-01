Feature: Create new workout session
  As a prospective jock
  In order to get fit
  I want to be able to create workout sessions based on workout patterns

Background:
  Given 2 workouts exists

  Scenario:
    When I try to create a new workout session
    Then I am given a choice of available workouts
    Given I create a workout session based on the workout: "workout-1"
    Then I see the new workout session
    And the target reps is set to the minimum
    And the weight is set to the minimum
