class AddColumnsForNestedSetInCategories < ActiveRecord::Migration
  def self.up
    change_column :categories, :parent_id, :integer, null: true, default: :nil
    add_column :categories, :lft, :integer, null: false, index: true, :default => 0
    add_column :categories, :rgt, :integer, null: false, index: true, :default => 0

    # optional fields
    add_column :categories, :depth, :integer, :null => false, :default => 0
    add_column :categories, :children_count, :integer, :null => false, :default => 0

    Category.where(parent_id: 0).update_all(parent_id: nil)

    Category.rebuild!
  end

  def self.down
    remove_column :categories, :lft
    remove_column :categories, :rgt

    # optional fields
    remove_column :categories, :depth
    remove_column :categories, :children_count
  end
end
