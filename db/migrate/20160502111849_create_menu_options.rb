class CreateMenuOptions < ActiveRecord::Migration
  def change
    create_table :menu_options do |t|
      t.string :name
      t.float :price
      t.integer :option_category_id

      t.timestamps null: false
    end
  end
end
