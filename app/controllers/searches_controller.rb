class SearchesController < ApplicationController
    before_action :authenticate_customer!

  def search
    @range = params[:range]
    if @range == "作品"
        @works = Work.looks(params[:search], params[:word])
    else
        @customers = Customer.looks(params[:search], params[:word])
    end
  end
end
