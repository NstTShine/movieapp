class SearchsController < ApplicationController

  def index
    if params[:category_id].present? || params[:country_id].present?
      @movies = Movie.in_category(params[:category_id])
        .in_country(params[:country_id]).page params[:page]
    elsif params[:search].present?
      @movies = Movie.search params[:search]
    else
      @movies = Movie.page params[:page]
    end
  end
end
