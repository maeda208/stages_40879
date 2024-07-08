class CommentsController < ApplicationController
  def create
    @stage = Stage.find(params[:stage_id])
    @apply = Apply.find(params[:apply_id])
    @comment = Comment.create(comment_params)
    redirect_to participate_stage_path(@stage, user_id: @apply.user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, stage_id: params[:stage_id], apply_id: params[:apply_id])
  end
end
