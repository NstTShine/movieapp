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
end
