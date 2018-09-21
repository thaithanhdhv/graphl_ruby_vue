class Api::V1::ArticlesController < ActionController::API
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all

    render json: ArticleSerializer.new(@articles)
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: ArticleSerializer.new(@article)
    else
      render json: @article.errors
    end
  end

  def update
    if @article.update(article_params)
      render json: ArticleSerializer.new(@article)
    else
      render json: @article.errors
    end
  end

  def destroy
    if @article.destroy
      render json: {message: "Deleted sucess!"}
    else
      render json: {message: "Cannot delete article"}
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
      render json: {message: "Not found!"} unless @article
    end

    def article_params
      params.require(:article).permit(:title, :content, :slug)
    end
end
