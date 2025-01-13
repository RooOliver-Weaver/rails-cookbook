class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image_url
      t.float :rating, null: false

      t.timestamps
    end
  end
end
