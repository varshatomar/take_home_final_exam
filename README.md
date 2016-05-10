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
 



Table of Contents for EthnicCookbook Project

app/models/recipe.rb ..................... Page 6
app/views/recipes/new.html.erb ........... Page 6
app/views /recipes/edit.html.erb ......... Page 6
app/views /layouts/application.html.erb .. Page 6
app/views /recipes/_form.html.erb ........ Page 7
app/views /recipes/index.html.erb ........ Page 8
app/views /recipes/show.html.erb ......... Page 9
app/assets/stylesheets/scaffolds.css ..... Pages 10 and 11
db/seeds.rb .............................. Page 12







--- app/models/recipe.rb ---------------------------------------------
class Recipe < ActiveRecord::Base
  attr_accessible :country, :directions, :prep_time, :servings, :title









end


--- app/views/recipes/new.html.erb -----------------------------------
<h1>New recipe</h1>

<%= render 'form' %>

<%= link_to 'Back', recipes_path %>



--- app/views/recipes/edit.html.erb ----------------------------------

<h1>Editing recipe</h1>

<%= render 'form' %>

<%= link_to 'Show', @recipe %> |
<%= link_to 'Back', recipes_path %>


--- app/views/layouts/application.html.erb ---------------------------

<!DOCTYPE html>
<html>
<head>
  <title>EthnicCookbook</title>
  <%= stylesheet_link_tag    "application", :media => "all" %>
</head>
<body>

<%= yield %>

</body>
</html>

--- app/views/recipes/_form.html.erb ---------------------------------


<%= form_for(@recipe) do |f| %>
  <% if @recipe.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@recipe.errors.count, "error") %> 
              prohibited this recipe from being saved:</h2>


      <ul>
      <% @recipe.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>


  <div class="field">
    <%= f.label :title %><br />
    <%= f.text_field :title %>
  </div>
  <div class="field">
    <%= f.label :country %><br />
    <%= f.text_field :country %>
  </div>
  <div class="field">
    <%= f.label :prep_time %><br />
    <%= f.number_field :prep_time %>
  </div>
  <div class="field">
    <%= f.label :servings %><br />
    <%= f.number_field :servings %>
  </div>
  <div class="field">
    <%= f.label :directions %><br />
    <%= f.text_area :directions %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>





--- app/views/recipes/index.html.erb ---------------------------------


<h1>Listing recipes</h1>


<table>
  <tr>
    <th>Title</th>
    <th>Country</th>
    <th>Prep time</th>
    <th>Servings</th>
    <th>Directions</th>
    <th></th>
    <th></th>
    <th></th>
  </tr>


<% @recipes.each do |recipe| %>
  <tr>
    <td><%= recipe.title %></td>
    <td><%= recipe.country %></td>
    <td><%= recipe.prep_time %></td>
    <td><%= recipe.servings %></td>
    <td><%= recipe.directions %></td>
    <td><%= link_to 'Show', recipe %></td>
    <td><%= link_to 'Edit', edit_recipe_path(recipe) %></td>
    <td><%= link_to 'Destroy', recipe, method: :delete, 
            data: { confirm: 'Are you sure?' } %></td>
  </tr>
<% end %>
</table>


<br />


<%= link_to 'New Recipe', new_recipe_path %>









--- app/views/recipes/show.html.erb --------------------------------



<p>
  <b>Title:</b>
  <%= @recipe.title %>
</p>


<p>
  <b>Country:</b>
  <%= @recipe.country %>
</p>


<p>
  <b>Prep time:</b>
  <%= @recipe.prep_time %>
</p>


<p>
  <b>Servings:</b>
  <%= @recipe.servings %>
</p>


<p>
  <b>Directions:</b>
  <%= @recipe.directions %>
</p>



<%= link_to 'Edit', edit_recipe_path(@recipe) %> |
<%= link_to 'Back', recipes_path %>











--- app/assets/stylesheets/scaffold.css.scss -----------------------


body {
  background-color: #fff;
  color: #333;
  font-family: verdana, arial, helvetica, sans-serif;
  font-size: 13px;
  line-height: 18px;
}


p, ol, ul, td {
  font-family: verdana, arial, helvetica, sans-serif;
  font-size: 13px;
  line-height: 18px;
}


pre {
  background-color: #eee;
  padding: 10px;
  font-size: 11px;
}


a {
  color: #000;
  &:visited {
    color: #666;
  }
  &:hover {
    color: #fff;
    background-color: #000;
  }
}


div {
  &.field, &.actions {
    margin-bottom: 10px;
  }
}





#notice {
  color: green;
}


.field_with_errors {
  padding: 2px;
  background-color: red;
  display: table;
}


#error_explanation {
  width: 450px;
  border: 2px solid red;
  padding: 7px;
  padding-bottom: 0;
  margin-bottom: 20px;
  background-color: #f0f0f0;
  h2 {
    text-align: left;
    font-weight: bold;
    padding: 5px 5px 5px 15px;
    font-size: 12px;
    margin: -7px;
    margin-bottom: 0px;
    background-color: #c00;
    color: #fff;
  }
  ul li {
    font-size: 12px;
    list-style: square;
  }
}


--- db/seeds.rb ----------------------------------------------------

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.


