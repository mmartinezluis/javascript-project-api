class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :update, :destroy]
  
    def index
      authors = Author.all
  
    #    render json: authors
      render json: AuthorBlueprint.render(authors)
    end
  
  
    def show
    #   render json: @author
    
    #   author = Author.find(params[:id])
    #   render json: AuthorBlueprint.render(@author, view: :normal)
      render json: QuoteBlueprint.render(@author.quotes.sample)
    end
  
 
    def create
      @author = Author.new(author_params)
  
      if @author.save
        render json: @author, status: :created, location: @author
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end
  
  
    def update
      if @author.update(author_params)
        render json: @author
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end
  
  
    def destroy
      @author.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def author_params
        params.require(:author).permit(:name)
      end
  end
  