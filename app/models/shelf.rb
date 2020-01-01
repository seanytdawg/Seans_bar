class Shelf < ApplicationRecord
  belongs_to :user
  has_many :drinks
  has_many :drink_ingredients, through: :drinks
  has_many :ingredients, through: :drink_ingredients

  # validates :name, presence: true
  # validates :name, uniqueness: true




#Search for alcoholic cocktails/mocktails
  # def self.get_alcohol(alcohol)
  #   alcohol_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=#{alcohol}")
  #   alcohol_hash = JSON.parse(alcohol_string)
  #   rescue
  # end 
  
  # #Search
  #   def self.get_mocktail(mocktail)
  #     mocktail_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=#{mocktail}")
  #     mocktail_hash = JSON.parse(mocktail_string)
  #     rescue
  #   end 



end
