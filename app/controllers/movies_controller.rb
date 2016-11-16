class MoviesController < ApplicationController
  before_action :load_movie, only: :show

  def show
    movie = @movie_support.movie
    rating_movie = @movie_support.rating_movie
  end

  def index
    @movies = Movie.page params[:page]
  end
end
