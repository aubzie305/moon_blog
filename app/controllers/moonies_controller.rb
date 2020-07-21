class MooniesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles

    @article = current_user.articles.build
  end     

  def feed 
    Article.where("user_id = ?", id)
  end
end