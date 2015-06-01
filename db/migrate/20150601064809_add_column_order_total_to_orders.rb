class AddColumnOrderTotalToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :order_total, :float, null: false, default: 0
  end
end
