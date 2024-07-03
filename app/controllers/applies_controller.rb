class AppliesController < ApplicationController
  before_action :authenticate_user!
  def create
    @stage = Stage.find(params[:stage_id])
    @apply = @stage.applies.build(user: current_user)
    if @apply.save
      redirect_to root_path
    else
      @applies = @stage.applies.includes(:user)
      redirect_to @apply.stage
    end
  end
  private
  def apply_params
    params.require(:apply).permit(:stage_id)
  end
end
