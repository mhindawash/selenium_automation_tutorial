@google
Feature: Google Search

  @homepage
  Scenario: Verify Google homepage loads
    Given I navigate to Google's homepage
    Then I should see the search bar

  @search
  Scenario: Search for a specific term
    Given I navigate to Google's homepage
    When I search for 'Cucumber BDD'
    Then I should see results for 'Cucumber BDD'

  @failure_test
  Scenario: Intentional failure to test screenshots
    Given I navigate to Google's homepage
    When I search for 'This test will fail'
    Then I should see results for 'Something that does not exist'
