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

    def update
      @apply = Apply.find_by(id: params[:id])
      @stage = @apply.stage
      payment = params.dig(:apply, :money).to_i
      ActiveRecord::Base.transaction do
          current_user.update!(money: current_user.money.to_i - payment)
          @apply.user.update!(money: @apply.user.money.to_i + payment)
      end
      redirect_to completion_stage_path(@stage) 
    end
    
  private
  def apply_params
    params.require(:apply).permit(:stage_id)
  end
end
