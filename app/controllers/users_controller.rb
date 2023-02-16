class UsersController < ApplicationController
  before_action :authenticate_user!
  def new; end

  def index
    @user = User.all
  end

  def show
    @user = User.find(current_user.id)
  end
end
