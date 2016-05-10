Kashfia Rahman
ITU ID: 89688
Final Exam Answer –take home part

Part C. Modify a Rails scaffold project.  The code on pages 6 to 12 is from the EthnicCookbook scaffold project.  Make the source code modifications as specified in items 1 through 10 directly on the source code pages. 
All relevant files are on dropbox: https://www.dropbox.com/s/dzh378p1zpgjg3r/Archive.zip?dl=0

1.	(5 pts) Write the rails generate scaffold statement that uses the model Recipe with fields title, country, prep_time, servings (number of servings), and directions.

rails generate scaffold Recipes title:string country:string prep_time:string servings:integer directions:string

2.	(3 pts) What is the URL that could be used to see the show view of the recipe with id 17 in the database table.

Change route.rb
root 'recipes#index'
https://ethinic-cook-book-kashfiarahman.c9users.io/recipes/17

3.	(5 pts) Write statements in the seed file that add this recipe to the database:
title: Baked Shrimp in Cream Sauce; country: France; servings: 4 Servings; prep_time: 15
Directions: 2 cups raw shrimp … bake forty-five minutes.

https://ethinic-cook-book-kashfiarahman.c9users.io/recipes/22

changes in seed.rb

Recipe.create!(title:  "Baked Shrimp in Cream Sauce",
               country: "France",
               prep_time: "15",
               servings: 4,
               directions: "2 cups raw shrimp … bake forty-five minutes",
               created_at: Time.zone.now,
               updated_at: Time.zone.now)  

4.	(5 pts) Write validations that insure that the title is non-empty, and that the prep_time and servings are numeric.

Add helper methods in recipe.rb model
 

5.	(3 pts) Modify the index view so that the description is removed and is only shown on the show view.
 
6.	(3 pts) An image is supplied in app/assets/images for each recipe with image name based on the id of its row in the recipes table.  For example, if the id of a recipe is 17, then its image is 17.jpg.  Modify the show view to show the image for the recipe of that view.

Upload image to cloud9 unde app/asset/images/
Add image_tag to show view
 

7.	(5 pts) Change the label from “Prep time” to “Preparation Time” on the index and show views, and also on the form on the new and edit views.
 
 
 

8.	(3 pts) Change the heading on the index view from “Listing recipes” to “Recipe Index.”
 
9.	(3 pts) Add a heading on the show view that contains the title of the recipe.
Add this line to show view
<h1><%= @recipe.title %></h1>
10.	(10 pts) Modify the CSS styles of the project to
a.	set the background color to WhiteSmoke,
b.	set the text color to RoyalBlue,
c.	set the font to Tahoma,
d.	set the color of all the h1 and h2 headers to FireBrick,
e.	adds a border to the table on the index view.
Change scaffold.scss
 



