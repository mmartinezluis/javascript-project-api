class QuotesController < ApplicationController

  def show
    author = Author.find_by(id: params[:author_id])
    if author
      render json: QuoteBlueprint.render(author.quotes.sample) 
    else 
      render json: "Author not found", status: :not_found
    end
  end

end
