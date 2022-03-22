class LibrariansController < ApplicationController
    before_action :set_librarian, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: %i[show index]
    def index
        @librarians = Librarian.all
    end
    
    def show
    end

    def edit
    end

    def new 
        @librarian = Librarian.new
    end
    
    def create
        @librarian = Librarian.new(librarian_params)
        if @librarian.save
            redirect_to @librarian, notice: "New librarian was successfully"
        else
            render "new"
        end
    end

    def update
        if @librarian.update(librarian_params) 
            redirect_to librarian_url(@librarian), notice: "Edit libirarians was successfully"
        else 
            redirect_to librarian_url(@librarian), notice: "Edit was not successful"
        end
    end

    def destroy
        @librarian.destroy
        redirect_to @librarian, notice: "Destroy librarian was successfully"
    end
    
    private
    def set_librarian
        @librarian = Librarian.find(params[:id]) 
    end

    def librarian_params
        params.require(:librarian).permit(:name, :age)
    end
end
