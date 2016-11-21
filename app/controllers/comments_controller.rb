class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @comments = Comment.find_by_movie(params[:movie_id])
      .page(params[:page]).per Settings.comment.per_page
    render partial: "/comments/comment", locals: {comment: @comment}
  end

  def destroy
    unless @comment.destroy
      render plain: "false"
    end
  end

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      render partial: "/comments/comment", locals: {comment: @comment}
    else
      render plain: "false"
    end
  end

  private
  def comment_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end
end
