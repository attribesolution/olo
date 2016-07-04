class AddDeviceosToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :deviceos, :string
  end
end
