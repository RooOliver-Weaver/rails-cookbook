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
require "json"
require "open-uri"

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
40.times do
  # p "Creating Recipe"
  recipe_api = "https://www.themealdb.com/api/json/v1/1/random.php"
  recipe_serialized = URI.parse(recipe_api).read
  recipe = JSON.parse(recipe_serialized)["meals"][0]
  # p recipe
  new_recipe = Recipe.new({ name: recipe["strMeal"], description: recipe["strInstructions"], image_url: recipe["strMealThumb"], rating: rand(0..10) })
  new_recipe.save
  p "#{new_recipe.name} has been added to the database"
end

# recipes = Recipe.create!([
#   { name: "Chocolate Cake", description: "Rich and moist chocolate cake.", image_url: "https://img.freepik.com/free-photo/closeup-tasty-chocolate-cake-with-chocolate-chunks-baking-sheet_1220-6329.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.8 },
#   { name: "Caesar Salad", description: "Classic Caesar salad with creamy dressing.", image_url: "https://img.freepik.com/premium-photo/classic-caesar-salad-with-chicken-sauce-plate-concrete-background-top-view_215990-1553.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.5 },
#   { name: "Spaghetti Carbonara", description: "Traditional Italian pasta dish.", image_url: "https://img.freepik.com/free-photo/homemade-fettuccine-with-savory-carbonara-sauce-generated-by-ai_24640-81731.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.7 },
#   { name: "Smoothie Bowl", description: "Healthy fruit smoothie bowl topped with granola.", image_url: "https://img.freepik.com/free-photo/high-angle-breakfast-dessert-bowl-with-banana-slices-cereal_23-2148417435.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.9 },
#   { name: "Margherita Pizza", description: "Authentic pizza with tomatoes, mozzarella, and basil.", image_url: "https://img.freepik.com/free-photo/top-view-delicious-pizza-with-fresh-cheese_23-2150096953.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.6 },
#   { name: "Pancakes", description: "Fluffy pancakes with syrup.", image_url: "https://img.freepik.com/free-photo/delicious-pancakes-with-fruit-honey_144627-41441.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.7 },
#   { name: "Beef Tacos", description: "Spicy beef tacos with fresh toppings.", image_url: "https://img.freepik.com/free-photo/creative-assortment-tasty-food_23-2148949073.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.8 },
#   { name: "Vegan Buddha Bowl", description: "Nourishing bowl with quinoa and roasted vegetables.", image_url: "https://img.freepik.com/free-photo/flat-lay-delicious-vegetarian-food-bowl_23-2148847450.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.9 },
#   { name: "Chicken Curry", description: "Creamy and spicy chicken curry.", image_url: "https://img.freepik.com/free-photo/chicken-red-curry-black-cup_1150-23928.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.8 },
#   { name: "Tomato Soup", description: "Comforting tomato soup with basil.", image_url: "https://img.freepik.com/free-photo/tomato-soup-crackers-cheese-bell-pepper-side-view_141793-12562.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.5 },
#   { name: "Garlic Bread", description: "Crispy garlic bread with butter.", image_url: "https://img.freepik.com/free-photo/homemade-tasty-bread-with-garlic-cheese-herbs-kitchen-table_1150-47123.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.6 },
#   { name: "Avocado Toast", description: "Simple and healthy avocado toast.", image_url: "https://img.freepik.com/free-photo/toast-with-assortment-vegetables_23-2148381383.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.7 },
#   { name: "Grilled Cheese Sandwich", description: "Cheesy and crispy sandwich.", image_url: "https://img.freepik.com/free-photo/close-up-melted-cheese-sandwich_23-2149286854.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.8 },
#   { name: "Pumpkin Soup", description: "Creamy pumpkin soup with spices.", image_url: "https://img.freepik.com/free-photo/flat-lay-winter-squash-soup-mug-with-croutons_23-2148706328.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.7 },
#   { name: "Fruit Salad", description: "Fresh and colorful fruit salad.", image_url: "https://img.freepik.com/free-photo/fresh-fruit-berry-salad-healthy-eating_114579-20456.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.6 },
#   { name: "Lemonade", description: "Refreshing homemade lemonade.", image_url: "https://img.freepik.com/free-photo/top-view-lemonade-glasses-arrangement_23-2148037116.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.5 },
#   { name: "BBQ Ribs", description: "Tender and smoky BBQ ribs.", image_url: "https://img.freepik.com/free-photo/smoky-ribs-sizzle-open-flame-grill_157027-4190.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.9 },
#   { name: "Shepherd's Pie", description: "Comforting pie with lamb and mashed potatoes.", image_url: "https://img.freepik.com/free-photo/portuguese-traditional-delicious-empadao-dish_23-2149863008.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.8 },
#   { name: "French Toast", description: "Classic French toast with cinnamon and sugar.", image_url: "https://img.freepik.com/free-photo/typical-easter-torrijas-spain_181624-61340.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.7 },
#   { name: "Stuffed Bell Peppers", description: "Bell peppers stuffed with rice and veggies.", image_url: "https://img.freepik.com/free-photo/front-view-cooked-bell-peppers-with-ground-meat-fresh-vegetables-dark-surface-meal-vegetable-food-meat-dolma_140725-74279.jpg?uid=P182328292&ga=GA1.1.902740772.1735809867&semt=ais_hybrid", rating: 4.6 }
# ])

# Seed Bookmarks
# bookmarks = Bookmark.create!([
#   { recipe: recipes[0], category: categories[0], comment: "Perfect for birthdays!" },
#   { recipe: recipes[2], category: categories[1], comment: "A quick and easy dinner." },
#   { recipe: recipes[5], category: categories[4], comment: "Great for a weekend breakfast." },
#   { recipe: recipes[7], category: categories[5], comment: "So healthy and delicious!" },
#   { recipe: recipes[12], category: categories[2], comment: "A comforting lunch option." },
#   { recipe: recipes[17], category: categories[1], comment: "Ideal for BBQ lovers." },
#   { recipe: recipes[19], category: categories[6], comment: "A gluten-free favorite." }
# ])

puts "Seeded #{Recipe.count} recipes, #{Category.count} categories!"
