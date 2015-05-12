class CreateMenuImages < ActiveRecord::Migration
  def change
    create_table :menu_images do |t|
      t.string :image
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
