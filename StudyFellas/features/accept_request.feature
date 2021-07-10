Feature: Group leader can accept group requests

Scenario: Accept user from group board
    Given I am authenticated as student
    Given There is an exam with teacher "Alberto Angela" and subject "Tuttologia"
    Given There is a group for this exam and I am the leader
    Given There is a request for the group
    When I am on group board
    And I press "Vedi richieste"
    Then I should be on the "Richieste per il gruppo" page
    When I press "Accetta"
    Then I should be on the "Board del gruppo" page
    And I should see the member in participants list
