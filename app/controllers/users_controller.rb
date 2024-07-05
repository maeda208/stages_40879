class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @stages = @user.stages.order("created_at DESC") 
    @apply = Apply.find_by(user_id: @user.id)
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザーが正常に作成されました。'
    else
      render :new
    end
  end

  def do_charge
    if request.post?
    current_user.money += params[:user][:money].to_i
    if current_user.save
      redirect_to root_path
    else
      render 'charge'
    end
  else
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date)
  end
end
