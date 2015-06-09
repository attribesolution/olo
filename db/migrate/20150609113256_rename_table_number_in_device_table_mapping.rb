class RenameTableNumberInDeviceTableMapping < ActiveRecord::Migration
  def change
  	rename_column :device_table_mappings, :table_number, :table_no
  end
end
