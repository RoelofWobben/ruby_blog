class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comments_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
  
end
