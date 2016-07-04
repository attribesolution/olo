class AddUuidToMenusAndCategories < ActiveRecord::Migration
  def change
  add_column :menus, :uuid, :string
  add_column :categories, :uuid, :string
  end
end
