class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
  has_many :reviews, dependent: :destroy
  # has_one_attached :photo

  validates :name, uniqueness: true

  private

  # def default_category_image(category_name)
  #   # raise
  #   default_images = {
  #     "Desserts" => "desserts-placeholder.jpg",
  #     "Main Courses" => "main-course-placeholder.jpg",
  #     "Breakfast" => "breakfast-placeholder.jpg",
  #     "Drinks" => "drink-placeholder.jpg",
  #     "Quick-Fix" => "quick-fix-placeholder.jpg",
  #     "Appetizers" => "appetizers-placeholder",
  #     "Gluten-Free" => "gluten-free-placeholder.jpg",
  #     "Vegetarian" => "vegetarian-placeholder.jpg"
  #   }

  #   # Return the image or a default one if the category name is not found
  #   default_images[category_name] || "main-course-placeholder.jpg"
  # end
end
