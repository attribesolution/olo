class AddMenuIdToMenuOptions < ActiveRecord::Migration
  def change
    add_column :menu_options, :menu_id, :integer
  end
end
