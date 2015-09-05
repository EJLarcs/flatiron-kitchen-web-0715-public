class RecipeIngredient < ActiveRecord::Base
  #associations
  belongs_to :recipe
  belongs_to :ingredient


end
