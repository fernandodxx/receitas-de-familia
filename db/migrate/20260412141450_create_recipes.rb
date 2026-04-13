class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.text :instructions
      t.string :category
      t.string :region
      t.string :occasion
      t.string :slug
      t.string :image_url
      t.integer :prep_time
      t.integer :servings

      t.timestamps
    end
    add_index :recipes, :title, unique: true
    add_index :recipes, :slug, unique: true
  end
end
