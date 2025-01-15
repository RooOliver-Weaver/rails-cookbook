# app/helpers/application_helper.rb or app/helpers/categories_helper.rb
module ApplicationHelper
  # Define a method to return default category images
  def default_category_image(category_name)
    # raise
    default_images = {
      "Desserts" => "desserts-placeholder.jpg",
      "Main Courses" => "main-course-placeholder.jpg",
      "Breakfast" => "breakfast-placeholder.jpg",
      "Drinks" => "drinks-placeholder.jpg",
      "Quick-Fix" => "quick-fix-placeholder.jpg",
      "Appetizers" => "appetizers-placeholder.jpg",
      "Gluten-Free" => "gluten-free-placeholder.jpg",
      "Vegetarian" => "vegetarian-placeholder.jpg"
    }

    # Return the image or a default one if the category name is not found
    default_images[category_name] || "main-course-placeholder.jpg"
  end

  # def default_image_urls
  #   {
  #     "Desserts" => { name: "Desserts", url: "desserts-placeholder.jpg" },
  #     "Main Courses" => { name: "Main Courses", url: "main-course-placeholder.jpg" },
  #     "Breakfast" => { name: "Breakfast", url: "breakfast-placeholder.jpg" },
  #     "Drinks" => { name: "Drinks", url: "drinks-placeholder.jpg" },
  #     "Quick-Fix" => { name: "Quick-Fix", url: "quick-fix-placeholder.jpg" },
  #     "Appetizers" => { name: "Appetizers", url: "appetizers-placeholder.jpg" },
  #     "Gluten-Free" => { name: "Gluten-Free", url: "gluten-free-placeholder.jpg" },
  #     "Vegetarian" => { name: "Vegetarian", url: "vegetarian-placeholder.jpg" }
  #   }
  # end
end
