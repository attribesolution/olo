class AddColumnItemTotalInOrderDetails < ActiveRecord::Migration
  def change
  	add_column :order_details, :item_total, :float, null: false, default: 0
  end
end
