Feature: creating new blog post

  Scenario: The new post is added to the top
    When I add a blog post
    Then it is added to the top of the list

  Scenario: The new post is not a duplicate post
    When I type in a duplicate post
    Then I see an error page



