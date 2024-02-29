class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :content
      t.text :rotation_period
      t.text :orbital_period
      t.text :diameter
      t.text :gravity
      t.text :terrain
      t.text :surface_water
      t.text :population
      t.text :climate
      t.string :image
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :solar_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
