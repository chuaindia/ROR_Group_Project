class Food < ApplicationRecord
  has_many :foods_recipes
  has_many :recipes, through: :foods_recipes
end