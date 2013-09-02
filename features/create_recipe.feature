Feature: Create a new recipe
 
  As a happy hobby chef
  So that I can create new stylish recipe documents
  I want to fill in my recipes' texts in a form and generate well formatted pdf documents

Background: Users have been added to database

  Given the following users exist:
  | id | name  | email               | password   | password_confirmation | admin |
  | 1  | User1 | usertest1@gmail.com | useruser1  | useruser1             | false |
  | 2  | User2 | usertest2@gmail.com | useruser2  | useruser2             | false |
  | 3  | Admin | admintest@gmail.com | adminadmin | adminadmin            | true  |
  And I am signed in as an user
  And I am on the topdf page
  
Scenario: Create new recipe document but reset
  
  Given I fill in "recipe_title" with "Testkuchen"
  And I fill in "recipe_persons" with "4"
  And I fill in "recipe_ingredients" with "4 Eier, 1l Milch, 500g Mehl"
  And I fill in "recipe_preparation" with "Alles umrühren und fertig!"
  When I press "Reset"
  Then I should be on the topdf page
  And I should not see "Testkuchen" 

Scenario: Create new recipe document
  
  Given I fill in "recipe_title" with "Testkuchen"
  And I fill in "recipe_persons" with "4"
  And I fill in "recipe_ingredients" with "4 Eier, 1l Milch, 500g Mehl"
  And I fill in "recipe_preparation" with "Alles umrühren und fertig!"  
  When I press "Create recipe"
  Then I should be on the preview page
  And I should see "Testkuchen"  

Scenario: Create new recipe document (sad path)
  
  Given I fill in "recipe_title" with ""
  And I fill in "recipe_persons" with ""
  And I fill in "recipe_ingredients" with ""
  And I fill in "recipe_preparation" with ""
  When I press "Create recipe"
  Then I should be on the recipes page
  And I should see "The form contains 5 errors."  

# Scenario: Accessing the Sign-in home page as an User
  
#   Given I am signed in as an user
#   And I am on the recipe creation page
#   And I should see "Los geht's!"
#   And I should see "Name des Gerichts"
#   When I click "Home"
#   Then I should be on the home page
#   And I should see "Willkommen"  
  

# Scenario: Accessing the Sign-in home page as an Admin
  
#   Given I am signed in as an admin
#   And I am on the index page
#   And I should see "Administer Users"
#   When I click "New User"
#   Then I should be on the new user page
#   And I should see "New User"