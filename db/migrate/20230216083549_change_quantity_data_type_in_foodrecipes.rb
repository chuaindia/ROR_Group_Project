class ChangeQuantityDataTypeInFoodrecipes < ActiveRecord::Migration[7.0]
  def up
    change_column :food_recipes, :quantity, 'integer USING CAST(quantity AS integer)'
  end

  def down
    change_column :food_recipes, :quantity, :string
  end
end
