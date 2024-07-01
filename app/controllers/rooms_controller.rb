class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
    @users = User.where.not(id: current_user.id)
  end
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path,notice: 'チャットルームが作成されました。'
    else
      @users = User.where.not(id: current_user.id)
      flash.now[:alert] = @room.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
