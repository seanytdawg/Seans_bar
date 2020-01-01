class DrinkIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :drink

  # validates :ingredient_id, :drink_id, presence: true
  
end
