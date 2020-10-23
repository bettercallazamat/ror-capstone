class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.opinion_id = params[:opinion_id]
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
