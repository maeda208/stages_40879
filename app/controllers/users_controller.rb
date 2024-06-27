class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @stages = user.stages.order("created_at DESC")
    
  end
end
