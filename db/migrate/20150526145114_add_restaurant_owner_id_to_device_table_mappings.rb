class AddRestaurantOwnerIdToDeviceTableMappings < ActiveRecord::Migration
  def change
    add_column :device_table_mappings, :restaurant_owner_id, :integer
  end
end
