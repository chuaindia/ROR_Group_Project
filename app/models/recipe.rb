class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, length: {in: 0..400}
  validates :cooking_time, length: {in: 0..400}
  validates :description, presence: true
  validates :public, presence: true
  belongs_to :user
  has_many :foods_recipes
  has_many :foods, through: :foods_recipes
end
