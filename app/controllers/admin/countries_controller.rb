class Admin::CountriesController < ApplicationController
  load_and_authorize_resource
  before_action :load_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.newest.page params[:page]
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new country_params
    if @country.save
      flash[:success] = t "country.create_success"
      redirect_to admin_countries_path
    else
      flash[:danger] = t "country.create_failed"
      render :new
    end
  end

  def update
    if @country.update_attributes country_params
      flash[:success] = t "country.update_success"
      redirect_to admin_countries_path
    else
      flash[:success] = t "country.update_failed"
      render :edit
    end
  end

  def destroy
    if @country.movies.any?
      flash[:danger] = t "country.data_constraints"
    elsif @country.destroy
      flash[:success] = t "country.delete_success"
    else
      flash[:success] = t "country.delete_failed"
    end
    redirect_to :back
  end

  private
  def load_country
    @country = Country.find_by id: params[:id]
  end

  def country_params
    params.require(:country).permit Country::ATTRIBUTES_PARAMS
  end
end
