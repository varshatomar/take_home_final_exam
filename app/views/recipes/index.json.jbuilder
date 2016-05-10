json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :country, :prep_time, :servings, :directions
  json.url recipe_url(recipe, format: :json)
end
