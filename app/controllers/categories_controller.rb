class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @bookmarks = @category.bookmarks.includes(:recipe)
    @reviews = @category.reviews
    @review = Review.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category), notice: "Category successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
