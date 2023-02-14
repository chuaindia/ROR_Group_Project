class FoodsController < ApplicationController
  def index
    @foods = @user.foods
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
    if @food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:error] = 'Error: Food could not be deleted'
    end
    redirect_to user_foods_url
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_food
    @food = set_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price, :quantity)
  end
end