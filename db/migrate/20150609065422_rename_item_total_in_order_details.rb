class RenameItemTotalInOrderDetails < ActiveRecord::Migration
  def change
  	rename_column :order_details, :item_total, :item_price
  end
end
