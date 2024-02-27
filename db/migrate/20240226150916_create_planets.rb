class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :content
      t.float :price_per_day
      t.references :users, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :solar_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
