class StagesController < ApplicationController
  def index
    @stages = Stage.includes(:user).order("created_at DESC")
  end

  def new
    @stage = Stage.new
  end

  def create
    @stage = Stage.new(stage_params)
    if @stage.save
      redirect_to root_path @stage
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:stage).permit(:reward, :title, :month_id, :day_id, :show_hour_id, :show_minute_id, :end_hour_id, :end_minute_id, :theater, :address, :conditions)
  end

end
