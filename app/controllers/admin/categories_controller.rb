class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create_success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "category.create_failed"
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "category.update_success"
      redirect_to admin_categories_path
    else
      flash[:success] = t "category.update_failed"
      render :edit
    end
  end

  def destroy
    if @category.movies.any?
      flash[:danger] = t "category.data_constraints"
    elsif @category.destroy
      flash[:success] = t "category.delete_success"
    else
      flash[:success] = t "category.delete_failed"
    end
    redirect_to :back
  end

  private
  def load_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit Category::ATTRIBUTES_PARAMS
  end
end
