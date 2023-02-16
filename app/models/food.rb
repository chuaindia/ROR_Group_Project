class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, :measurement_unit, :price, :quantity, presence: true

  has_many :foods_recipes
  has_many :recipes, through: :food_recipes
end
