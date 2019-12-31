class DrinksController < ApplicationController

before_action :find_drink, only: [:show, :edit, :update, :destroy]

    def index
        @drinks = Drink.all
    end

    def show
        #@drink = Drink.find(params[:id])
        #@drink_details = Drink.get_cocktail(params[:name])
    end

    def new
        @drink = Drink.new
    end

    def create 
        @drink = Drink.create(params[:id])
        redirect_to drink_path(@drink)
    end

    def search
        
    end 

    def handle_search
        cocktail_hash = Drink.get_cocktail(params[:name])
        drink = Drink.find_or_create_by(name: cocktail_hash["drinks"][0]["strDrink"])
        redirect_to drink_path(drink)
    end


    # def get_cocktail_stats(name)
    #     cocktail_hash = Drink.get_cocktail(params[:name])
    # end

private

def find_drink
    @drink = Drink.find(params[:id])
end
    



end
