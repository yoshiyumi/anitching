class Admin::WorksController < ApplicationController
  def index
      @genre_id = params[:genre_id]
      if params[:genre_id].present?
          @works = Work.where(genre_id: params[:genre_id]).page(params[:page]).per(12)
          if params[:tag_id].present?
              @works = @works.joins(:tags).where(tags: {id: params[:tag_id]}).page(params[:page]).per(12)
          end
      else
          @works = Work.all
          if params[:tag_id].present?
              @works = @works.joins(:tags).where(tags: {id: params[:tag_id]}).page(params[:page]).per(12)
          else
              @works = Work.all.page(params[:page]).per(12)
          end
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

  
  
  def destroy
      @work = Work.find(params[:id])
      @work.destroy
      redirect_to works_path
  end

  def work_params
      params.require(:work).permit(:name, :image, :synopsis, :release_date, :genre_id, tag_ids: [])
  end


end
