class AddSortOrderToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :sort_order, :integer
  end
end
