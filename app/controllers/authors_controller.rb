class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]
  
  def index
    authors = Author.all
    render json: AuthorBlueprint.render(authors)
  end

  def show
    render json: QuoteBlueprint.render(@author.quotes.sample)
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name)
    end
  end
  