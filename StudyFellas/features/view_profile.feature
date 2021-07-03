Feature: Group member can view another member's profile

Scenario: View profile from group board
    Given I am authenticated as student
    Given There is an exam with teacher "Alberto Angela" and subject "Tuttologia"
    Given There is a group for this exam with another student as leader with name "Supremo" and surname "Leader"
    Given I belong to the group
    When I am on group board
    And I press "Visita il profilo"
    Then I should be on the Profilo personale page and i should see "Supremo" and "Leader"
    And the exam of the group should have teacher "Alberto Angela" and subject "Tuttologia"