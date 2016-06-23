class ChangeDeviceosToDeviceOs < ActiveRecord::Migration
  def change
  rename_column :orders, :deviceos, :device_os
  end
end
