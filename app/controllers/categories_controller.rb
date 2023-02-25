class CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: CategoryBlueprint.render(categories)
  end

  def show
    category = Category.find_by(id: params[:category_id])
    if category
      render json: QuoteBlueprint.render(category.quotes.sample)
    else
      render json: "Category not found", status: :not_found
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end


end
