class Api::V1::AuthorsController < ActionController::API
  before_action :set_author, only: [:show, :update, :destroy]

  def index
    @authors = Schema.execute params[:querry]

    render json: @authors
  end

  def show; end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: AuthorSerializer.new(@author)
    else
      render json: @author.errors
    end
  end

  def update
    if @author.update(author_params)
      render json: AuthorSerializer.new(@author)
    else
      render json: @author.errors
    end
  end

  def destroy
    if @author.destroy
      render json: {message: "Delete completed"}
    else
      render json: {message: "Cannot delete author"}
    end
  end

  private
    def set_author
      @author = Author.find_by id: params[:id]
      render json: {message: "Author not found"} unless @author
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
