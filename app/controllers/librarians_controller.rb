class LibrariansController < ApplicationController
    before_action :set_librarian, only: %i[show edit update destroy]
    def index
        @librarians = Librarian.all
    end
    
    def show
    end

    def edit
    end

    def new 
    @librarians = Librarian.new
    end
    
    def create
        @librarians = Librarian.new(librarian_params)
        if @librarians.save
            redirect_to @librarians, notice: "New librarians was successfully"
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
        redirect_to @librarian, notice: "Destroy librarians was successfully"
    end
    
    private
    def set_librarian
        @librarian = Librarian.find(params[:id]) 
    end

    def librarian_params
        params.require(:librarian).permit(:name, :age)
    end
end
