Feature: User can create a group

Scenario: Create a group from Homepage
    Given I am authenticated as student
    Given I am on StudyFellas Homepage
    Given There is an exam with teacher "Alberto Angela" and subject "Tuttologia"
    When I press "Crea Gruppo"
    Then I should be on the "Aggiungi Gruppo" page
    When I select option "Tuttologia, Alberto Angela" from element "exam_id" and I fill in "description" with "Mio gruppo." and I select option "5" from element "max_members"
    And I press "Aggiungi"
    Then I should be on the "Board del gruppo" page
    And I should see "Tuttologia" and "Alberto Angela" and "Mio gruppo." and "Kungfu Panda"
