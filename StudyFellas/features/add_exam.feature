Feature: Administrator can add an exam

Scenario: Add an exam from Homepage
    Given I am on StudyFellas Homepage
    When I press "Gestisci esami disponibili"
    Then I should be on the Esami disponibili page
    When I press "Aggiungi esame"
    Then I should be on the Aggiungi esame page
    When I fill in "Esame" with "Tuttologia" and "Docente" with "Alberto Angela"
    And I press "Aggiungi"
    Then I should be on the Esami disponibili page
    And I should see "Tuttologia" and "Alberto Angela"
