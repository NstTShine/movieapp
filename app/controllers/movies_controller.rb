class MoviesController < ApplicationController
  before_action :load_movie, only: :show

  def show
    @comment = Comment.new movie: @movie_support.movie
  end

  def index
    @movies = Movie.page params[:page]
  end
end
