module LibrarianHelper
    def format_name(librarian)
        if librarian.age >= 18
            "Mr. #{librarian.name}"
        else
            "#{librarian.name}"
        end
    end
end
