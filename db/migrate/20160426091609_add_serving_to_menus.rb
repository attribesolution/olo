class AddServingToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :serving, :string
  end
end
