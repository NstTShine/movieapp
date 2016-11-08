class RatingMoviesController < ApplicationController
  before_action :check_login_for_rate, only: :create

  def create
    @rating_movie = RatingMovie.new rating_movie_params
    @rating_movie.user_id = current_user.id

    if @rating_movie.save
      render json: {id: @rating_movie.id, rating: @rating_movie.movie.rating},
        status: :ok
    else
      render json: {notice: t("sever_error")}, status: :internal_server_error
    end
  end

  def update
    @rating_movie = RatingMovie.find_by id: params[:id]
    if @rating_movie.update rating_movie_params
      render json: {rating: @rating_movie.movie.rating}, status: :ok
    else
      render json: {notice: t("sever_error")}, status: :internal_server_error
    end
  end

  private
  def rating_movie_params
    params.require(:rating_params).permit RatingMovie::ATTRIBUTES_PARAMS
  end
end
