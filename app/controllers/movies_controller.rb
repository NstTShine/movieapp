class MoviesController < ApplicationController
  before_action :check_admin
  before_action :load_movie, only: :show

  def show
    @comment = Comment.new movie: @movie_support.movie
  end

  def index
    @movies = Movie.page params[:page]
  end

  private
  def check_admin
    if current_user.present?
      if current_user.role == "admin"
        redirect_to admin_movies_path
      end
    end
  end

end
