class AddUuidToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
