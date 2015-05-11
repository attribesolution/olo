class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :restaurant_owner_id

      t.timestamps null: false
    end
  end
end
