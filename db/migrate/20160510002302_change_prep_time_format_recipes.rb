class ChangePrepTimeFormatRecipes < ActiveRecord::Migration
  def change
    change_column :recipes, :prep_time, :integer
  end
end
