class StagesController < ApplicationController
  def index
    @stages = Stage.includes(:user).order("created_at DESC")
  end

  def new
    @stages = Stage.new
  end

  def create
    Stage.create(stage_params)
    redirect_to '/'
  end

  def destroy
    stage = Stage.find(params[:id])
    stage.destroy
    redirect_to root_path
  end

  def edit
    @stage = Stage.find(params[:id])
  end

  def update
    stage = Stage.find(params[:id])
    stage.update(stage_params)
    redirect_to root_path
  end

  def show
    @stage = Stage.find(params[:id])
  end

  private
  def stage_params
    params.require(:stage).permit(:reward, :title, :month, :day, :show_hour, :show_minute, :end_hour, :end_minute, :theater, :address, :conditions).merge(user_id: current_user.id)
  end

end
