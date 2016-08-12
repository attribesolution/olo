class AddIsPrintedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_printed, :boolean, default: false
  end
end
