class CommentsController < ApplicationController
  # allow only authenticated user to destroy comments on article
  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to root_url
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to root_url
  end
  
  private
    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end
end
