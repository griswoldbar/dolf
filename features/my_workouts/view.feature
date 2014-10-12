Feature: View my past workouts
  As a prospective jock
  In order to track my performance
  I want to see a record of my past workouts


  Scenario: User has taken some workouts and looks at results
    Given the workout: "the killer" exists with name: "the killer"
    And the workout: "the horror" exists with name: "the horror"
    And the following drills exist:
    | drill   | exercise_name | workout               | min_reps | max_reps |
    | drill-1 | torture       | workout: "the killer" | 4        | 6        |
    | drill-2 | agony         | workout: "the killer" | 5        | 10       |
    | drill-3 | pain          | workout: "the killer" | 7        | 12       |
    | drill-4 | misery        | workout: "the horror" | 10       | 10       |
    | drill-5 | hell          | workout: "the horror" | 2        | 5        |
    And I take the workout: "the killer" and achieve:
    | drill   | weight | reps |
    | drill-1 | 5      | 6    |
    | drill-2 | 5      | 7    |
    | drill-3 | 5      | 6    |
    And I take the workout: "the horror" and achieve:
    | drill   | weight | reps |
    | drill-4 | 5      | 12   |
    | drill-5 | 5      | 4    |
    And I take the workout: "the killer" and achieve:
    | drill   | weight | reps |
    | drill-1 | 7.5    | 6    |
    | drill-2 | 5      | 9    |
    | drill-3 | 5      | 8    |
    When I go to my workouts
      Then I should see the following table:
      | workout    | relative score | absolute score |
      | the killer | 0              | 19             |
      | the horror | 0              | 16             |
      | the killer | 6              | 25             |
