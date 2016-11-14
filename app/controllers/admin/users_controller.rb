class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search_user].present?
      @users = User.search params[:search_user], page: params[:page],
        per: Settings.user.per_page
    else
      @users = User.latest.page(params[:page]).per Settings.user.per_page
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = @user.name + t("user.delete_success")
    else
      flash[:danger] = @user.name + t("user.delete_fail")
    end
    redirect_to admin_users_url
  end
end
