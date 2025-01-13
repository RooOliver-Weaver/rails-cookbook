# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
Bookmark.destroy_all
Recipe.destroy_all
Category.destroy_all

# Seed Categories
categories = Category.create!([
  { name: "Desserts" },
  { name: "Main Course" },
  { name: "Appetizers" },
  { name: "Drinks" },
  { name: "Breakfast" },
  { name: "Vegetarian" },
  { name: "Gluten-Free" }
])

# Seed Recipes
recipes = Recipe.create!([
  { name: "Chocolate Cake", description: "Rich and moist chocolate cake.", image_url: "https://example.com/chocolate_cake.jpg", rating: 4.8 },
  { name: "Caesar Salad", description: "Classic Caesar salad with creamy dressing.", image_url: "https://example.com/caesar_salad.jpg", rating: 4.5 },
  { name: "Spaghetti Carbonara", description: "Traditional Italian pasta dish.", image_url: "https://example.com/spaghetti_carbonara.jpg", rating: 4.7 },
  { name: "Smoothie Bowl", description: "Healthy fruit smoothie bowl topped with granola.", image_url: "https://example.com/smoothie_bowl.jpg", rating: 4.9 },
  { name: "Margherita Pizza", description: "Authentic pizza with tomatoes, mozzarella, and basil.", image_url: "https://example.com/margherita_pizza.jpg", rating: 4.6 },
  { name: "Pancakes", description: "Fluffy pancakes with syrup.", image_url: "https://example.com/pancakes.jpg", rating: 4.7 },
  { name: "Beef Tacos", description: "Spicy beef tacos with fresh toppings.", image_url: "https://example.com/beef_tacos.jpg", rating: 4.8 },
  { name: "Vegan Buddha Bowl", description: "Nourishing bowl with quinoa and roasted vegetables.", image_url: "https://example.com/buddha_bowl.jpg", rating: 4.9 },
  { name: "Chicken Curry", description: "Creamy and spicy chicken curry.", image_url: "https://example.com/chicken_curry.jpg", rating: 4.8 },
  { name: "Tomato Soup", description: "Comforting tomato soup with basil.", image_url: "https://example.com/tomato_soup.jpg", rating: 4.5 },
  { name: "Garlic Bread", description: "Crispy garlic bread with butter.", image_url: "https://example.com/garlic_bread.jpg", rating: 4.6 },
  { name: "Avocado Toast", description: "Simple and healthy avocado toast.", image_url: "https://example.com/avocado_toast.jpg", rating: 4.7 },
  { name: "Grilled Cheese Sandwich", description: "Cheesy and crispy sandwich.", image_url: "https://example.com/grilled_cheese.jpg", rating: 4.8 },
  { name: "Pumpkin Soup", description: "Creamy pumpkin soup with spices.", image_url: "https://example.com/pumpkin_soup.jpg", rating: 4.7 },
  { name: "Fruit Salad", description: "Fresh and colorful fruit salad.", image_url: "https://example.com/fruit_salad.jpg", rating: 4.6 },
  { name: "Lemonade", description: "Refreshing homemade lemonade.", image_url: "https://example.com/lemonade.jpg", rating: 4.5 },
  { name: "BBQ Ribs", description: "Tender and smoky BBQ ribs.", image_url: "https://example.com/bbq_ribs.jpg", rating: 4.9 },
  { name: "Shepherd's Pie", description: "Comforting pie with lamb and mashed potatoes.", image_url: "https://example.com/shepherds_pie.jpg", rating: 4.8 },
  { name: "French Toast", description: "Classic French toast with cinnamon and sugar.", image_url: "https://example.com/french_toast.jpg", rating: 4.7 },
  { name: "Stuffed Bell Peppers", description: "Bell peppers stuffed with rice and veggies.", image_url: "https://example.com/stuffed_peppers.jpg", rating: 4.6 }
])

# Seed Bookmarks
bookmarks = Bookmark.create!([
  { recipe: recipes[0], category: categories[0], comment: "Perfect for birthdays!" },
  { recipe: recipes[2], category: categories[1], comment: "A quick and easy dinner." },
  { recipe: recipes[5], category: categories[4], comment: "Great for a weekend breakfast." },
  { recipe: recipes[7], category: categories[5], comment: "So healthy and delicious!" },
  { recipe: recipes[12], category: categories[2], comment: "A comforting lunch option." },
  { recipe: recipes[17], category: categories[1], comment: "Ideal for BBQ lovers." },
  { recipe: recipes[19], category: categories[6], comment: "A gluten-free favorite." }
])

puts "Seeded #{Recipe.count} recipes, #{Category.count} categories, and #{Bookmark.count} bookmarks!"
