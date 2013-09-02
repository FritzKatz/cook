Feature: Enter application via Sign-In-Page
 
  As a happy hobby chef
  So that I can generate stylish recipe documents
  I want to access my favorite recipe generator app

#Background: Users have been added to database

  #Given the following users exist:
  #| id | name  | email               | password_digest | admin |
  #| 1  | User  | usertest@gmail.com  | useruser        | false |
  #| 2  | Admin | admintest@gmail.com | adminadmin      | true  |
  
Scenario: Access Sign-in Page

  Given I am on the home page
  Then I should see the link "Sign in"
  

Scenario: Accessing the Sign-in home page as an Admin
  
  Given I am signed in as an admin
  And I am on the index page
  And I should see "Administer Users"
  When I click "New User"
  Then I should be on the new user page
  And I should see "New User"
  
Scenario: Accessing the Sign-in home page as an User
  
  Given I am signed in as an user
  And I am on the topdf page  
  When I click "Recipes"
  Then I should be on the recipe index page  

Scenario: Accessing the Sign-in home page as an Admin / User (sad path)
  
  Given I am on the signin page
  When I fill in "session_email" with "wrong@email.com"
  And I fill in "session_password" with "wrongpassword"
  And I click "Sign in"
  Then I should be on the signin page  

  