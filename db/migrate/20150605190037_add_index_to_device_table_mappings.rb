class AddIndexToDeviceTableMappings < ActiveRecord::Migration
  def change
  	add_index(:device_table_mappings, [:device_name, :restaurant_owner_id], :unique => true, :name => 'unique_restaurant_devices')
  end
end
