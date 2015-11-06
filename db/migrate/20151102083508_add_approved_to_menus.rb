class AddApprovedToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :approved, :boolean, :default => true, :null => false
    add_index  :menus, :approved
  end
end
