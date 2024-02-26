class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :content
      t.float :price_per_day
      t.references :user_id, null: false, foreign_key: true
      t.references :category_id, null: false, foreign_key: true
      t.references :solar_system_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
