class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :country
      t.string :prep_time
      t.integer :servings
      t.string :directions

      t.timestamps null: false
    end
  end
end
