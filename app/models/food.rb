class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, through: :food_recipes, dependent: :destroy
end
