class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_categories
  before_action :load_countries

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      user_params.permit :name, :email, :password,
      :password_confirmation
    end
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :name, :email, :password,
      :password_confirmation, :current_password
    end
  end

  def load_categories
    @categories = Category.all
  end

  def load_countries
    @countries = Country.all
  end

  protected
  def load_movie
    movie = Movie.find_by id: params[:id]
    if movie.nil?
      render file: "public/404.html", status: :not_found, layout: true
    else
      rating_movie =  movie.rating_movies.find_by user_id: current_user.try(:id)
      @movie_support = Supports::MovieSupport.new movie,
        rating_movie, movie.rating_movies.length
    end
  end

  def check_login_for_rate
    if current_user.nil?
      respone[:notice] = t "rate_require_login"
      render json: respone, status: 403
      return
    end
  end
end
