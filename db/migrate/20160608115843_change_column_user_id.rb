class ChangeColumnUserId < ActiveRecord::Migration
  def change
  	rename_column :order_logs, :user_id, :restaurant_owner_id
  end
end
