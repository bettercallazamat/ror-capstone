class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.opinion_id = params[:opinion_id]
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong...'
      render root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
