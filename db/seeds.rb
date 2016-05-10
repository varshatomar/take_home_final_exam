# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Recipe.create!(title:  "Baked Shrimp in Cream Sauce",
               country: "France",
               prep_time: "15",
               servings: 4,
               directions: "2 cups raw shrimp … bake forty-five minutes",
               created_at: Time.zone.now,
               updated_at: Time.zone.now)  



#20.times do |n|
#  title  = "Biriyani-#{n+1}"
#  country = "Bangladesh"
#  prep_time = "#{n}"
#  servings = n
#  directions = "Cook"
#  Recipe.create!(title:  title,
#               country: country,
#               prep_time: prep_time,
#               servings: servings,
#               directions:    directions,
#               created_at: Time.zone.now,
#               updated_at: Time.zone.now)  
#end
