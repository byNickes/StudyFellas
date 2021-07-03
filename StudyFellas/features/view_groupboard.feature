Feature: Group member can view the group board of the group

Scenario: View the Group Board
    Given I am authenticated as student
    Given There is an exam with teacher "Alberto Angela" and subject "Tuttologia"
    Given There is a group for this exam with another student as leader with name "Supremo" and surname "Leader"
    Given I belong to the group
    When I am on StudyFellas homepage
    And I press "Entra"
    Then I should be on the Group Board
