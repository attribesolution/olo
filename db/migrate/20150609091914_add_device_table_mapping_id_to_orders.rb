class AddDeviceTableMappingIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :device_table_mapping_id, :integer
  end
end
