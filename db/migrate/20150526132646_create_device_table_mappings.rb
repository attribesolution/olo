class CreateDeviceTableMappings < ActiveRecord::Migration
  def change
    create_table :device_table_mappings do |t|
      t.string :device_id
      t.string :device_name
      t.string :table_number

      t.timestamps null: false
    end
    add_index :device_table_mappings, :device_id, unique: true
  end
end
