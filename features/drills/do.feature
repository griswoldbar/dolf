Feature: Do a drill
  As a prospective jock
  In order to increase my strength on an exercise
  I want the reps and weight targets to shift as I progress


  Scenario Outline: Meeting, beating and failing to meet reps targets
    Given a workout: "the killer" exists
    And the following drills exist
    | drill   | exercise_name | workout               | min_reps | max_reps |
    | drill-1 | torture       | workout: "the killer" | 4        | 6        |
    When I take the workout: "the killer"
      Then I should see the first drill
      And the target reps should be 4
    When I achieve <reps> reps
    And I complete the rest of the workout
    And I take the workout: "the killer" again
      Then I should see the first drill
      And the target reps should be <target>
      And the target weight should be <weight_change>
    Examples:
      | reps | target | weight_change |
      | 4    | 5      | the same      |
      | 3    | 4      | less          |
      | 5    | 6      | the same      |
      | 6    | 4      | greater       |
      | 7    | 4      | greater       |


  Scenario: User changes the target weight on an exercise

  Scenario: User aborts workout halfway through
