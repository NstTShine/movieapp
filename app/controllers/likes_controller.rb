class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    movie = Movie.find params[:movie_id]
    current_user.follow movie
    respond_to do |format|
      format.html {redirect_to @movie}
      format.js
    end
  end

  def destroy
    moive = Like.find(params[:id]).movie_id
    current_user.unfollow moive
    respond_to do |format|
      format.html {redirect_to @movie}
      format.js
    end
  end
end
