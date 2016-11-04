class MoviesController < ApplicationController

  def index
    @movies = Movie.page params[:page]
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:success] = t "movie_created"
      redirect_to movies_path
    else
      render :new
    end
  end

  private
  def movie_params
    params.require(:movie).permit Movie::ATTRIBUTES_PARAMS
  end
end
