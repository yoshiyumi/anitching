class Public::WorksController < ApplicationController
  def index
     @works = Work.all
     @works = Work.page(params[:page]).per(10)

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
   tag_ids = params[:work][:tag_ids]
   tag_ids.delete_at(0)
   genre_id = params[:work][:genre_id].to_i
   @work.genre_id = genre_id
   
      if @work.save
        @work.save_tags(tag_ids)
        redirect_to works_path
      else
        render :new
      end
   
  end

  def edit
    @work = Work.find(params[:id])
    @genres = Genre.all
  end

  def update
    @work = Work.find(params[:id])
    tag_ids = params[:work][:tag_ids]
    tag_ids.delete_at(0)
    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else

     render :edit
    end
  end
  
  def destroy
   @work = Work.find(params[:id])
   @work.destroy
    redirect_to works_path
  end

  def work_params
    params.require(:work).permit(:name, :image, :synopsis, :release_date, :genre_id)
  end
end
