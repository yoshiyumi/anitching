class Public::FavoritesController < ApplicationController
  before_action :set_work
  before_action :authenticate_customer!  
  

  def create
    if @work.customer_id != current_customer.id   
      @favorite = Favorite.create(customer_id: current_customer.id, work_id: @work.id)
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, work_id: @work.id)
    @favorite.destroy
  end

  private
  def set_work
    @work = Work.find(params[:work_id])
  end
end
