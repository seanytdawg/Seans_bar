class DrinkIngredientsController < ApplicationController
    before_action :find_drink_ing, only: [:show, :edit, :update, :destroy]

    def index
        @drink_ings = DrinkIngredient.all 
    end

    def show
        #@drink_ing = DrinkIngredient.find(params[:id])
    end

    def new
        @drink_ing = DrinkIngredient.new
    end

    def create
        @drink_ing = DrinkIngredient.create(drink_ing_params)
    end

    def edit
        #@drink_ing = DrinkIngredient.find(params[:id])
    end

    def update
        #@drink_ing = DrinkIngredient.find(params[:id])
        @drink_ing.update(drink_ing_params)

        redirect_to edit_drink_ingredient_path
    end

    def destroy
        #@di = DrinkIngredient.find(params[:id])
        @drink_ing.delete
        redirect_to drink_ingredients_path
    end


    private

    def find_drink_ing
        @drink_ing = DrinkIngredient.find(params[:id])
    end

    def drink_ing_params
        params.require(:drink_ingredients).permit(:drink_id, :ingredient_id)
    end


end
