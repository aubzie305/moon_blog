class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index 
    @articles = Article.all.page(params[:page]).per(10)
  end

  def create 
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to moony_path(@article.user)
    else 
      flash[:article_errors] = @article.errors.full_messages
      redirect_to moony_path(@article.user)
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Moony article deleted"
    if request.referrer.nil? || request.referrer == articles_url
      redirect_to articles_path
    else
      redirect_to request.referrer
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
