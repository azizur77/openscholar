Feature:
  Testing the creation of the a new site.

  @api @javascript
  Scenario: Test the creation of a new site and verify that we don't get JS alert.
    Given I am logging in as "admin"
      And I wait for page actions to complete
     When I visit "/"
      And I click "Create a site"
      And I fill in "edit-domain" with "mysite"
      And I press "edit-submit"
      And I wait for page actions to complete
     Then I should see "Success! The new site has been created."
      And I visit the site "mysite"
      And I should see "Your site's front page is set to display your bio by default."
