class Ingredient < ApplicationRecord
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    # validates :name, presence: true
    # validates :name, uniqueness: true

    def self.get_ingredients_hash
        ingredients_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
        ingredients_hash = JSON.parse(ingredients_string)
        rescue
      ingredients_hash
      end 
    
      def self.get_ingredients_array
        ingredients_hash = Ingredient.get_ingredients_hash
        ingredients_hash["drinks"].map do |ingredient_hash|
            ingredient_hash["strIngredient1"]
        end 
      end

end
