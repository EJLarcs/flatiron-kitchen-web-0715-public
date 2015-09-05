class Recipe < ActiveRecord::Base
  #associations
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  #validations
  validates :name, presence: true
end
