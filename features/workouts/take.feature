Feature: Do a workout
  As a prospective jock
  In order to get fit
  I want to be able to create workout sessions based on workout patterns


  Scenario: User sets up his first workout
    Given 2 workouts exists
    And I have never done a workout
    When I try to create a new workout session
      Then I should be given a choice of available workouts
      When I create a workout session based on the workout: "workout-1"
        Then I should see the new workout session details
        And the target reps should be set to the minimum on each exercise
        And the weight should be set to the minimum on each exercise

  Scenario: User does a workout
    Given I have never done a workout
    And the workout: "super workout" exists
    And I have created a workout session based on the workout: "super workout"
    When I start the workout
      Then I should see the first drill
      When I fill in my results with weight: 4000, reps: 4
      And I ask for the next drill
      And I fill in my results weight: 6000, reps: 15
      And I complete the workout
        Then I should see my results

  Scenario: User meets the target reps on an exercise
    # Given I have never done a workout
    # And I have created the default workout session
    # When I start the workout
    # Then I should see the first exercise
    # Given I have met the reps target
    # And I have filled in my reps
    # And I have completed the exercise

  Scenario: User beats the target reps on an exercise

  Scenario: User does not meet the target reps on an exercise

  Scenario: User changes the target reps and weight on an exercise

  Scenario: User aborts workout halfway through

  # Scenario: User does his second workout
  #   Given I have done the workout "workout-1" before
  #   When I try to create a new workout session
  #   And I create a workout session based on the workout: "workout-1"
  #   Then I see the new workout session details
  #   And the target reps is set to the minimum on each exercise
  #   And the weight is set to the minimum on each exercise