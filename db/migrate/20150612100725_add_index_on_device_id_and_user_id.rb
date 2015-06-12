class AddIndexOnDeviceIdAndUserId < ActiveRecord::Migration
  def change
  	add_index(:device_table_mappings, [:device_id, :restaurant_owner_id], :unique => true, :name => 'unique_devices_per_restaurant')
  end
end
