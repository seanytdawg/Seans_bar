class DrinkIngredientsController < ApplicationController
    before_action :find_drink_ing, only: [:show, :edit, :update, :destroy]

    def index
        @dis = DrinkIngredient.all 
    end

    def show
        #@di = DrinkIngredient.find(params[:id])
    end

    def new
        @di = DrinkIngredient.new
    end

    def create
        @di = DrinkIngredient.create(drink_ing_params)
    end

    def edit
        #@di = DrinkIngredient.find(params[:id])
    end

    def update
        #@di = DrinkIngredient.find(params[:id])
        @di.update(drink_ing_params)
        redirect_to edit
    end

    def destroy
        #@di = DrinkIngredient.find(params[:id])
        @di.delete
        redirect_to drink_ingredients_path
    end


    private

    def find_drink_ing
        @di = DrinkIngredient.find(params[:id])
    end

    def drink_ing_params
        params.require(:drink_ingredients).permit(:drink_id, :ingredient_id)
    end


end
