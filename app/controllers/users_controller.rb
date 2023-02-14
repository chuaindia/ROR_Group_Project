class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end

  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
