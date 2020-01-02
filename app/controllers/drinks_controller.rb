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
        drink = Drink.create(drink_params)
        redirect_to drink_path(drink)
    end

    def search
        if params[:name]
            @cocktail_hash = Drink.get_cocktail(params[:name])
        end
    end 

    def handle_search
        @cocktail_hash = Drink.get_cocktail(params[:name])

        if @cocktail_hash["drinks"]
            render :results
        else 
            flash[:messages] = "Cocktail not found"
            redirect_to drinks_search_path
        end 
    end


    # def get_cocktail_stats(name)
    #     cocktail_hash = Drink.get_cocktail(params[:name])
    # end

private

def find_drink
    @drink = Drink.find(params[:id])
end

def drink_params
    params.require(:drink).permit(:name, :shelf_id)
end
    

end
