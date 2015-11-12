class AddDirtyToMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :dirty, :boolean, :default => false, :null => false
  end
end
