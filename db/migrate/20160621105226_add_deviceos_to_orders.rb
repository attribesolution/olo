class AddDeviceosToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :deviceos, :integer
  end
end
