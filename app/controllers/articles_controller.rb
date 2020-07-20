class ArticlesController < ApplicationController
  def index 
    @articles = Article.all
  end

  def create 
    @article = current_user.articles.build(article_params)
    if @article.save
      #flash[:success] = "Micropost created!"
      redirect_to 'moonies/show'
    else
      render 'static_pages/home'
    end
  end

  def destroy 
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
