class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: params[:user_id])
  end

  def new
    @recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end

  def create
    @userid = params[:user_id]
    @recipe = Recipe.new(handle_par)
    @recipe.user_id = @userid
    if @recipe.save
      flash[:success] = 'succesfully created new recipe'
      redirect_to user_recipes_path(params[:user_id])
    else
      flash.new[:error] = "couldn't create the recipe"
      render :new
    end
  end

  def show
    @recipes = Recipe.where(user_id: params[:user_id], id: params[:id], public: true)
    @foods = Food.where(user_id: params[:user_id])
  end

  def public_recipes
    @user = User.find(params[:user_id])
    @recipes = Recipe.where(user_id: params[:user_id], public: true).order(created_at: :desc)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:success] = "deleted #{@recipe.name} succesfully"
    redirect_to user_recipes_path(params[:user_id])
  end

  private

  def handle_par
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
