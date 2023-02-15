class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, length: { in: 0..400 }
  validates :cooking_time, length: { in: 0..400 }
  validates :description, presence: true
  belongs_to :user
  has_many :food_recipes
  has_many :foods, through: :food_recipes
end
