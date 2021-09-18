class Public::HomesController < ApplicationController
    def top
      @genres = Genre.all
      @works = Work.limit(12)
    end
    
    def about
    end
end
