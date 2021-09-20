class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @comment = current_customer.comments.build(comment_params)
    @work = Work.find(params[:work_id])
    

    if @comment.save
      redirect_to work_review_path(@work.id,@comment.review.id)
    else
      @review = Review.find(params[:review_id])
      @comments = @review.comments
      @comment_reply = @review.comments.build
      render work_review_path(@work.id,@comment.review.id), notice: '投稿できませんでした...'
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    @work = Work.find(params[:work_id])
    @comment.destroy
    redirect_to work_review_path(@work.id,@comment.review.id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :review_id, :customer_id, :parent_id)
  end
end
