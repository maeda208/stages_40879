class StagesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy,:participate,:pay_form, :pay,:completion]
  before_action :set_stage, only: [:edit, :show,:destroy,:pay_form ,:pay]
  before_action :user_signed, only: [:edit, :destroy,:pay_form, :pay, :comletion]
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
    @stage.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    stage = Stage.find(params[:id])
    stage.update(stage_params)
    redirect_to stage_path
  end

  def show
    @apply = Apply.new
    @applies = @stage.applies 
  end

  def participate
    
    @stage = Stage.find(params[:stage_id] || params[:id])
    @apply = Apply.find_by(stage_id: @stage.id, user_id: params[:user_id])
    @comment = Comment.new
    @comments = Comment.where(stage_id: @stage.id, apply_id: @apply.id)
  end

  def pay_form
    @apply = Apply.find_by(stage_id: @stage.id, user_id: params[:user_id])
    if @apply.nil?
      redirect_to root_path, alert: '申し込みが見つかりません。'
      return
    end
  end
  
  def pay
    @apply = Apply.find_by(stage_id: @stage.id, user_id: params[:user_id])
    if current_user.money < @stage.reward
      redirect_to root_path, alert: '残高が不足しています。'
      return
    end
  
    begin
      ActiveRecord::Base.transaction do
        current_user.update!(money: current_user.money - @stage.reward)
        @apply.user.update!(money: @apply.user.money + @stage.reward)
        redirect_to completion_stage_path(@stage)
      end
  
    
    end
   end

   def completion
   end
  



  private
  def set_stage
    @stage = Stage.find(params[:id])
  end

  def user_signed
    return if current_user.id == @stage.user_id

    redirect_to action: :index
  end

  def stage_params
    params.require(:stage).permit(:reward, :title, :month_id, :day_id, :show_hour_id, :show_minute_id, :end_hour_id, :end_minute_id, :theater, :address, :conditions, :start_time).merge(user_id: current_user.id)
  end

end
