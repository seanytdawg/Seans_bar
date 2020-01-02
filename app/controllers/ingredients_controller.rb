class IngredientsController < ApplicationController

    before_action :find_ingredient, only: [:show, :edit, :update, :destroy]
  
  def index
    @ingredients = Ingredient.all
  end

  def show
    #@ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
        ingredient = Ingredient.create(ingredient_params)
    if ingredient.valid?
    redirect_to ingredient_path(ingredient)
    else
      flash[:messages] = ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end    
  end

  def edit
    #@ingredient = Ingredient.find(params[:id])
  end

  def update
    #@ingredients = Ingredients.find(params[:id])
    if @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)

    else

      flash[:messages] = @ingredient.errors.full_messages
      redirect_to edit_ingredient_path
    end
  end

  def destroy
    #@ingredient = Ingredient.find(params[:id])
    @ingredient.delete
    redirect_to ingredients_path
  end


  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end


end
