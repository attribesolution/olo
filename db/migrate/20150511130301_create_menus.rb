class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :restaurant_owner_id
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
