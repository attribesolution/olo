class RemoveColumnRestaurantOwnerIdFromOrderLogs < ActiveRecord::Migration
  def change
  	remove_column :order_logs, :restaurant_owner_id
  end
end
