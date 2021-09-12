class Public::WorksController < ApplicationController
  def index
     @works = Work.joins(:genres).where(genres: {id: params[:genre_id]})
    if params[:tag_id].present?
      @works = Work.joins(:tags).where(tags: {id: params[:tag_id]}).page(params[:page]).per(10)
    else
      
      @works = Work.all.page(params[:page]).per(10)
    end
     
     @tags = Tag.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    @genres = Genre.all
  end

  def create
   @work = Work.new(work_params)
   @work.customer_id = current_customer.id
   tag_ids = params[:work][:tag_ids]
   tag_ids.delete_at(0)
      if @work.save
        redirect_to works_path
      else
        render :new
      end
   
  end

  def edit
    @work = Work.find(params[:id])
    @genres = Genre.all
    if @work.customer_id == current_customer.id
      render :edit
    else
      redirect_to works_path
    end
  end

  def update
    @work = Work.find(params[:id])
    tag_ids = params[:work][:tag_ids]
    tag_ids.delete_at(0)
    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else
     @genres = Genre.all
     render :edit
    end
  end
  
  def destroy
   @work = Work.find(params[:id])
   @work.destroy
    redirect_to works_path
  end

  def work_params
    params.require(:work).permit(:name, :image, :synopsis, :release_date, :genre_id, tag_ids: [])
  end
end
