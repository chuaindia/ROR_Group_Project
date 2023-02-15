class PublicRecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end