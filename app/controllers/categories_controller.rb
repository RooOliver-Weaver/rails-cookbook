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
    @default_image_urls = {
        "Desserts" => { name: "Desserts", url: "desserts-placeholder.jpg" },
        "Main Courses" => { name: "Main Courses", url: "main-course-placeholder.jpg" },
        "Breakfast" => { name: "Breakfast", url: "breakfast-placeholder.jpg" },
        "Drinks" => { name: "Drinks", url: "drinks-placeholder.jpg" },
        "Quick-Fix" => { name: "Quick-Fix", url: "quick-fix-placeholder.jpg" },
        "Appetizers" => { name: "Appetizers", url: "appetizers-placeholder.jpg" },
        "Gluten-Free" => { name: "Gluten-Free", url: "gluten-free-placeholder.jpg" },
        "Vegetarian" => { name: "Vegetarian", url: "vegetarian-placeholder.jpg" }
      }
  end

  def create
    @category = Category.new(category_params)

    if params[:category][:image].present?
      uploaded_image = Cloudinary::Uploader.upload(params[:category][:image])
      @category.image = uploaded_image["secure_url"]
    elsif params[:category][:default_image].present?
      @category.image = params[:category][:default_image]
    end

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
    params.require(:category).permit(:name, :image, :default_image)
  end
end
