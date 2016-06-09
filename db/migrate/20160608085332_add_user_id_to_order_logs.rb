class AddUserIdToOrderLogs < ActiveRecord::Migration
  def change
    add_column :order_logs, :user_id, :integer
  end
end
