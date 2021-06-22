class QuotesController < ApplicationController

  def show
    quote = Quote.find_by(id: params[:id])
    if quote
      render json: QuoteBlueprint.render(quote, view: :extended)
    else
      render json: quote.errors
    end
  end

end
