class AddDefaultImageToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :default_image, :string
  end
end
