class MooniesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles

    @article = current_user.articles.build if user_signed_in?
    p @article
  end     
end