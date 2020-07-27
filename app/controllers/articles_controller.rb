class ArticlesController < ApplicationController
  def index 
    @articles = Article.all
  end

  def create 
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to moony_path(@article.user), notice: "New Moony article posted!"
    else 
      flash[:article_errors] = @article.errors.full_messages
      redirect_to moony_path(@article.user)
    end
  end

  def destroy 
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
