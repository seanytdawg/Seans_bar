class Drink < ApplicationRecord
  belongs_to :shelf
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  validates :name, presence: true
  validates :name, uniqueness: true

  #Search cocktail specifically by name
  def self.get_cocktail(cocktail)
    cocktail_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}")
    cocktail_hash = JSON.parse(cocktail_string)
    rescue
  cocktail_hash
  end 

  def self.get_stats(cocktail)
    cocktail_hash = get_cocktail(cocktail)
    puts cocktail_hash["drinks"][0]["strCategory"]
    puts cocktail_hash["drinks"][0]["strAlcoholic"]
    puts cocktail_hash["drinks"][0]["strGlass"]
    puts cocktail_hash["drinks"][0]["strInstructions"]
  end
  
  def self.get_ingredients(cocktail_hash)
    ingredients = []
    n = 1
    while n < 15
      if cocktail_hash["drinks"][0]["strIngredient#{n}"]
    ingredients << cocktail_hash["drinks"][0]["strIngredient#{n}"]
      end 
    n += 1
    end 
    return ingredients
  end 

    def self.get_measurements(cocktail_hash)
    n = 1
      while n < 15
       if cocktail_hash["drinks"][0]["strMeasure#{n}"]
    puts "#{n}. " + cocktail_hash["drinks"][0]["strMeasure#{n}"] + cocktail_hash["drinks"][0]["strIngredient#{n}"]
        end 
    n += 1
      end 
    end 
end 
