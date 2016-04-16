class ChangeDefaultValuesInCategories < ActiveRecord::Migration
  def change
    change_column :categories, :image, :string, default: "", null: false
    change_column :categories, :name, :string, default: "", null: false
    change_column :categories, :parent_id, :integer, default: 0, null: false
  end
end
