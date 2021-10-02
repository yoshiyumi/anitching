class Public::WorksController < ApplicationController
  before_action :authenticate_customer!,except: [:index, :ranking]
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

  def create
    @genres = Genre.all
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

  def ranking
    @genres = Genre.all
    if params[:ranking_name] == "評価順"
      @reviews = Review.group(:work_id).order('avg desc, count desc').limit(50).select("COUNT(reviews.rate) as count, AVG(reviews.rate) as avg, reviews.work_id")
    elsif params[:ranking_name] == "評価数順"
      @reviews = Review.group(:work_id).order('count desc').limit(50).select("COUNT(reviews.rate) as count, reviews.work_id")
    elsif params[:ranking_name] == "ジャンル別評価順"
      @works = Work.where(genre_id: params[:genre_id]).pluck(:id)
      @reviews = Review.where(work_id: @works).group(:work_id).order('avg desc, count desc').limit(50).select("COUNT(reviews.rate) as count, AVG(reviews.rate) as avg, reviews.work_id")
    elsif params[:ranking_name] == "ジャンル別評価数順"
      @works = Work.where(genre_id: params[:genre_id]).pluck(:id)
      @reviews = Review.where(work_id: @works).group(:work_id).order('count desc').limit(50).select("COUNT(reviews.rate) as count, reviews.work_id")
    end

  end

  def update
    @genres = Genre.all
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
    if @work.customer_id == current_customer.id
      @work.destroy
      redirect_to works_path
    else
      redirect_to work_path(params[:id])
    end
  end

  def work_params
    params.require(:work).permit(:name, :image, :synopsis, :release_date, :genre_id, tag_ids: [])
  end
end
