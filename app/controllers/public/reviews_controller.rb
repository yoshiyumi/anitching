class Public::ReviewsController < ApplicationController
  def index
     @reviews = Review.where(work_id: params[:work_id])
     @reviews = @reviews.page(params[:page]).per(10)
     @work = Work.find(params[:work_id])
     @rate_ave = Review.where(work_id: params[:work_id]).average(:rate)
  end

  def show
      @review = Review.find(params[:id])
      @work = Work.find(params[:work_id])
      @comments = @review.comments
      @comment = @review.comments.build 
      @comment_reply = @review.comments.build 
  end

  def new
      @review = Review.new
      @work = Work.find(params[:work_id])
  end

  def create
      @review = Review.new(review_params)
      @review.customer_id = current_customer.id
      @review.work_id =  params[:work_id]
      if @review.save
        redirect_to work_reviews_path(params[:work_id])
      else
        render :new
      end
   
  end

  
  def destroy
      @review = Review.find(params[:id])
      @review.work_id =  params[:work_id]
      @review.destroy
       redirect_to work_reviews_path(params[:work_id])
  end

  def review_params
       params.require(:review).permit(:thoughts, :rate, :customer_id, :work_id)
  end
end
