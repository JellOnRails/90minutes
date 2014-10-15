Feature: Issue object
  In order to manage issue in the system
  As a user
  I want to be able to edit issue

  Background: log in
    Given I am logged as a jira_valid_user in jira system

  @issue @create
  Scenario: Create issue
    When I create new issue
    Then I should see success message

  @issue @edit
  Scenario: Edit issue
    Given I create new issue
    When I edit current issue
    Then I should see updated fields in current issue

  @issue @search
  Scenario: Search
    Given I create new issue
    When I search for issue
    Then I should see current issue
