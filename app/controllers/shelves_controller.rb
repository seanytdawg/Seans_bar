class ShelvesController < ApplicationController


    def index
        shelves = Shelf.all
    end

    def show
        shelf = Shelf.find(params[:id])
    end



end
