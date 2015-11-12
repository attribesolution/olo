class AddUpdateToDeviceTableMappings < ActiveRecord::Migration
  def change
  	add_column :device_table_mappings, :updated, :boolean, :default => true
  end
end
