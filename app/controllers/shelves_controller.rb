class ShelvesController < ApplicationController


def index
    @shelves = Shelf.all
end

def show
    @shelf = Shelf.find(shelf_params[:id])
end

def new
@shelf = Shelf.new
end 

def create
@shelf = Shelf.create(shelf_params)

redirect_to shelf_path(@shelf)
end 

private

def shelf_params
    params.require(:shelf).permit(:name, :user_id)
end

end
