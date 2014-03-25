Feature: User functionality testing.

  @api
  Scenario: Verify that user pages are inaccessible to anonymous users.
    Given I am not logged in
     Then I should be redirected in the following <cases>:
  #  | Request                    | Response Code | Final URL   |
     | users/admin                | 403           | users/admin |

  @api
  Scenario: User pages are accessible to the logging in user.
    Given I am logging in as "john"
     When I visit "/user"
     Then I should see "View"
      And I should see "Edit"

  @api @nofar
  Scenario: Adding a user to a vsite.
    Given I am logging in as "john"
     When I visit "john/cp/users/add"
      And I fill in "User" with "michelle"
      And I press "Add users"
     Then I should see "michelle has been added to the group John."
  And I remove all create permissions for basic members in vsite "john"

  @api @nofar
  Scenario: Enable custom roles and permissions in a VSite.
    Given I am logging in as "john"
      And I visit "john/cp/users/permissions"
     When I click "Edit roles and permissions"
      And I press "Confirm"
      And I visit "john/cp/users/permissions"
     Then I should see the button "Save permissions"
    And I restore all create permissions for basic members in vsite "john"

  @api @nofa
  Scenario: Create a custom role in a vsite.
    Given I am logging in as "john"
     When I visit "john/cp/users/roles"
      And I fill in "Name" with "New Custom Role"
      And I press "Add role"
      And I visit "john/cp/users/roles"
     Then I should see "New Custom Role"

  @api @nofa
  Scenario: Assign a custom role to a vsite member.
    Given I am logging in as "john"
     When I give the user "klark" the role "New Custom Role" in the group "john"
     Then I should verify that the user "klark" has a role of "New Custom Role" in the group "john"

  @api @nofa
  Scenario: Test access to "Add New Content" page - check failure.
    Given I am logging in as "john"
      And I remove all create permissions for basic members in vsite "john"
     When I am logging in as "klark"
      And I go to "john/cp/content/add"
      And I should get a "403" HTTP response
     Then I restore all create permissions for basic members in vsite "john"

  @api @nofa
  Scenario: Give permissions to a custom role.
    Given I am logging in as "john"
     Then I give the role "New Custom Role" in the group "john" the permission "Create Blog entry content"

  @api @nofa
  Scenario: Test access to "Add New Content" page - check success.
    Given I am logging in as "john"
      And I remove all create permissions for basic members in vsite "john"
     When I am logging in as "klark"
      And I go to "john/cp/content/add"
      And I should get a "200" HTTP response
     Then I restore all create permissions for basic members in vsite "john"

  @api @nofa
  Scenario: Test access to "Add New Content" - check failure on other vsites.
    Given I am logging in as "john"
      And I remove all create permissions for basic members in vsite "john"
     When I am logging in as "michelle"
      And I go to "obama/cp/content/add"
      And I should get a "200" HTTP response
     Then I go to "john/cp/content/add"
      And I should get a "403" HTTP response

  @api @nofa
  Scenario: Test node creation permissions of a custom role - check failure.
    Given I am logging in as "klark"
     When I go to "john/node/add/book"
     Then I should get a "403" HTTP response

  @api @nofa
  Scenario: Test node creation permissions of a custom role - check success.
    Given I am logging in as "klark"
     When I go to "john/node/add/blog"
     Then I should get a "200" HTTP response

  @api @nofa
  Scenario: Restore default roles and permissions in a VSite.
    Given I am logging in as "john"
      And I visit "john/cp/users/roles"
     When I click "Restore default roles and permissions"
      And I press "Confirm"
      And I visit "john/cp/users/roles"
     Then I should not see the button "Save permissions"
