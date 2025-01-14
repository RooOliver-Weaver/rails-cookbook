class ReviewsController < ApplicationController
  before_action :set_category, only: [ :new, :create ]

  def new
    @review = @category.reviews.new
  end

  def create
    # raise
    @review = @category.reviews.new(review_params)
    if @review.save
      redirect_to category_path(@category), notice: "Review added successfully"
    else
      @bookmarks = @category.bookmarks.includes(:recipe) # Ensures bookmarks are available
      @reviews = @category.reviews
      render "categories/show", status: :unprocessable_entity
      # redirect_to category_path(@category), notice: "Review can't be blank"
    end
  end

  def destroy
    # raise
    @review = Review.find(params[:id])
    # logger.debug "Attempting to delete review with ID: #{@review.id}"
    # logger.debug "Review content: #{@review.content}"
    if @review.destroy
    # logger.debug "Review successfully deleted"
    redirect_to category_path, notice: "Review successfully deleted"
    else
    # logger.debug "Failed to delete review"
    redirect_to category_path(@category), alert: "Failed to delete review"
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
