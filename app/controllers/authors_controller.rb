class AuthorsController < ApplicationController
  before_action :set_author, only: [:show]
  
  def index
    authors = Author.all
    render json: AuthorBlueprint.render(authors)
  end

  def show
    if author
      render json: QuoteBlueprint.render(author.quotes.sample)
    else
      render json: "Author not found", status: :not_found
    end
  end

  private
    def set_author
      author = Author.find_by(id: author_params[:author_id])
    end

    def author_params
      params.require(:author).permit(:name, :author_id)
    end
  end
  