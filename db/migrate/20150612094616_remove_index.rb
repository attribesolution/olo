class RemoveIndex < ActiveRecord::Migration
  def change
  	remove_index :device_table_mappings, :device_id
  end
end
