class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :persons
      t.text :ingredients
      t.text :preparation
      t.binary :image

      t.timestamps
    end
  end
end
