class Ingredient < ActiveRecord::Base
  #associations
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  #validations
  validates :name, presence: true
end
