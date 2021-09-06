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
    if @work.save
      redirect_to admin_work_path(@work.id)
    else
     @works = Work.all
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
    @genres = Genre.all
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to admin_work_path(@work.id)
    else

     render :edit
    end
  end

  def work_params
    params.require(:works).permit(:name, :image, :synopsis, :release_date, :tag_id, :genre_id)
  end
end
