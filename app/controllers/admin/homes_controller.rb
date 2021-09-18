class Admin::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @works = Work.all
    end
end
