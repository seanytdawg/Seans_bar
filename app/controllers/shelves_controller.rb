class ShelvesController < ApplicationController

 before_action :find_shelf, only: [:show, :edit, :update, :destroy]
  
  def index
    @shelves = Shelf.all
  end

  def show
    #@shelf = Shelf.find(params[:id])
  end

  def new
    @shelf = Shelf.new
  end

  def create
        shelf = Shelf.create(shelf_params)
    if shelf.valid?
    redirect_to shelf_path(shelf)
    else
      flash[:messages] = shelf.errors.full_messages
      redirect_to new_shelf_path
    end    
  end

  def edit
    #@shelf = Shelf.find(params[:id])
  end

  def update
    #@shelf = Shelf.find(params[:id])
    if @shelf.update(shelf_params)
    redirect_to shelf_path(@shelf)
    else
      flash[:messages] = @shelf.errors.full_messages
      redirect_to edit_shelf_path
    end
  end

  def destroy
    #@shelf = Shelf.find(params[:id])
    @shelf.delete
    redirect_to shelves_path
  end


  private

  def find_shelf
    @shelf = Shelf.find(params[:id])
  end

  def shelf_params
    params.require(:shelf).permit(:shelfname, :password)
  end
    



end
