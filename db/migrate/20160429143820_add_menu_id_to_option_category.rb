class AddMenuIdToOptionCategory < ActiveRecord::Migration
  def change
    add_column :option_categories, :menu_id, :integer
  end
end
