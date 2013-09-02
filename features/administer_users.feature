Feature: Administer Users of Application
 
  As the admin of a bunch of happy hobby chefs
  So that I can administer the users of the Application
  I want to be able to create, edit or delete Users

Background: Users have been added to database  
  
  Given the following users exist:
  | id | name  | email               | password   | password_confirmation | admin |
  | 1  | User1 | usertest1@gmail.com | useruser1  | useruser1             | false |
  | 2  | User2 | usertest2@gmail.com | useruser2  | useruser2             | false |
  | 3  | Admin | admintest@gmail.com | adminadmin | adminadmin            | true  |
  
  And I am signed in as an admin
  And I am on the index page

  
Scenario: Create New User

  Given I click "New User"
  When I fill in "user_name" with "John"
  And I fill in "user_email" with "test@gmail.com"
  And I fill in "user_password" with "testtest"
  And I fill in "user_password_confirmation" with "testtest"
  And I press "Create account"
  Then I should be on the index page
  And I should see "John"


Scenario: Create New User (sad path)

  Given I click "New User"
  When I fill in "user_name" with ""
  And I fill in "user_email" with ""
  And I fill in "user_password" with ""
  And I fill in "user_password_confirmation" with ""
  And I press "Create account"
  Then I should be on the users page
  And I should see "The form contains 7 errors."  

Scenario: Edit User
  
  Given I click "User1"
  When I fill in "user_name" with "John Revised"
  And I fill in "user_email" with "testrevised@gmail.com"
  And I fill in "user_password" with "testtestrev"
  And I fill in "user_password_confirmation" with "testtestrev"
  And I press "Save changes"
  Then I should be on the index page
  And I should see "Profile updated."
  And I should see "John Revised"  


Scenario: Edit User (sad path)
  
  Given I click "User1"  
  When I press "Save changes"
  Then I should be on the users page for "User1"
  And I should see "The form contains 3 errors."  
  

@javascript
Scenario: Delete Multiple Users

  Given I am on the index page  
  When I check "user_ids_" for User with id "1"
  When I check "user_ids_" for User with id "2"  
  And I click "Delete User(s)"
  Then I should be on the index page
  And I should see "User was successfully deleted."
  And I should not see "usertest1@gmail.com"
  And I should not see "usertest2@gmail.com"


@javascript
Scenario: Delete Multiple Users (sad path)

  Given I am on the index page  
  When I check "user_ids_" for User with id "1"
  And I uncheck "user_ids_" for User with id "1"  
  And I click "Delete User(s)"
  Then I should be on the index page
  And I should see "No user/s selected."
  And I should see "usertest1@gmail.com"   