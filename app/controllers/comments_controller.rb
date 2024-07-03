class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, stage_id: params[:stage_id], apply_id: params[:apply_id])
  end
end
