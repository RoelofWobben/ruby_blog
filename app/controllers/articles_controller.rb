class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @recent_posts = Article.order(created_at: :desc).limit(5)
  end

  def show
    @article = Article.find(params[:id])
    @recent_posts  = Article.all.order(created_at: :desc).limit(5)
  end

  def new
    @article = Article.new
    @recent_posts  = Article.all.order(created_at: :desc).limit(5)
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else 
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    @recent_posts  = Article.all.order(created_at: desc).limit(5)
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end
  