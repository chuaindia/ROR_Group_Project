class RenameFoodsRecipesToFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_table :foods_recipes, :food_recipes
  end
end
