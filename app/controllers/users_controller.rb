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

  def charge
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def do_charge
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if request.post?
      charge = charge_money
      if charge.paid
    current_user.money += params[:user][:money].to_i
    if current_user.save
      redirect_to root_path
    else
      flash[:alert] = 'チャージができませんでした。'
      render 'charge'
    end
  else
    flash[:alert] = 'チャージができませんでした。'
    render 'charge'
  end
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :money).merge(token: params[:token])
  end

  def charge_money
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: params[:user][:money],  
      card: params[:token],    
      currency: 'jpy'
    )
end
end