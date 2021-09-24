class Public::HomesController < ApplicationController
    def top
      @genres = Genre.all
      @works = Work.limit(12)
    end
    
    def about
    end
    
    def follow
      @following_customers = current_customer.following_customer
      @follower_customers = current_customer.follower_customer
    end
end
