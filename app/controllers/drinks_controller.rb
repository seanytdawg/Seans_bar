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
        if drink.valid?
        redirect_to drink_path(drink)
        else
        flash[:messages] = drink.errors.full_messages
        redirect_to new_drink_path
        end    
    end

    def edit
        #@drink = Drink.find(params[:id])
    end

    def update
        #@drink = Drink.find(params[:id])
        if @drink.update(drink_params)
        redirect_to drink_path(@drink)
        else
      flash[:messages] = @drink.errors.full_messages
      redirect_to edit_drink_path
        end
    end

    def destroy
        #@drink = Drink.find(params[:id])
        @drink.delete
        redirect_to drinks_path
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


    

private

def find_drink
    @drink = Drink.find(params[:id])
end

def drink_params
    params.require(:drink).permit(:name, :shelf_id)
end
    

end
