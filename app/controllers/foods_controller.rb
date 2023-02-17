class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[index show create destroy]
  before_action :set_user, only: %i[index show create destroy]

  def index
    @foods = Food.where(user_id: params[:user_id])
  end

  def show
    @food
  end

  def new
    @food = Food.new
  end

  def create
    @food = @user.foods.new(**food_params)

    if @food.save
      flash[:success] = 'Food saved successfully'
      redirect_to user_foods_url
    else
      flash.now[:error] = 'Error: Food could not be saved'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:error] = 'Error: Food could not be deleted'
    end
    redirect_to user_foods_url
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_food
    @food = Food.where(id: params[:id])
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price, :quantity)
  end
end
