Feature: Todo categories
  As a user
  I want to assign categories to todos and filter by category
  So that I can focus on related tasks

  Scenario: User filters todos by an existing category
    Given the following todos exist:
      | description     | category |
      | Finish homework | study    |
      | Buy groceries   | personal |
      | Clean room      | home chores |
    When I visit the todos page
    And I filter todos by "study"
    Then I should see "Finish homework"
    And I should not see "Buy groceries"
    And I should not see "Clean room"

  Scenario: User filters by a category with no matching todos
    Given the following todos exist:
      | description     | category |
      | Finish homework | study    |
      | Buy groceries   | personal |
    When I visit the todos page
    And I filter todos by "work"
    Then I should see "No todos found"
    And I should not see "Finish homework"
    And I should not see "Buy groceries"