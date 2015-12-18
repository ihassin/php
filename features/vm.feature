Feature: VM is created

  Background:
    Given I have a vm at "stage.php.com"

  Scenario: Adding users
    Then I can log on as "deploy"

  Scenario: Accessing the web
    When I navigate to it
    Then I see "Hello PHP World!"
