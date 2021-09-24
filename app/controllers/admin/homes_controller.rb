class Admin::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @works = Work.all.page(params[:page]).per(12)
    end
end
