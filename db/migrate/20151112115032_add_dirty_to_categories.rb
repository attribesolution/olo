class AddDirtyToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :dirty, :boolean, :default => false, :null => false
  end
end
