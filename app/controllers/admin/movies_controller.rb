class Admin::MoviesController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search_movie].present?
      @movies = Movie.search params[:search_movie], page: params[:page],
        per: Settings.movie.per_page
    elsif params[:category_id].present? || params[:country_id].present?
      @movies = Movie.in_category(params[:category_id])
        .in_country(params[:country_id]).page params[:page]
    else
      @movies = Movie.newest.page(params[:page]).per Settings.movie.per_page
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:success] = t "movie_created"
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  private
  def movie_params
    params.require(:movie).permit Movie::ATTRIBUTES_PARAMS
  end
end
