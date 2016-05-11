class AddTableCoverToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :table_cover, :integer
    add_column :orders, :order_time, :datetime
  end
end
