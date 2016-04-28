class CreateOptionCategories < ActiveRecord::Migration
  def change
    create_table :option_categories do |t|
      t.string :name
      t.integer :user_id
      t.boolean :multiple_choice
      t.boolean :required

      t.timestamps null: false
    end
  end
end
