class Public::HomesController < ApplicationController
    def top
     @genres = Genre.all
     @works = Work.all
    end
    def about
    end
end
