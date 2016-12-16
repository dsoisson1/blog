Feature: viewing main page

  Scenario: seeing only ten posts
    When I visit the home page
    Then I see the latest ten posts

