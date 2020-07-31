class MooniesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(10)

    @article = current_user.articles.build if user_signed_in?
    p @article
  end     

  def edit 
    @user = User.find(params[:id])
  end
end