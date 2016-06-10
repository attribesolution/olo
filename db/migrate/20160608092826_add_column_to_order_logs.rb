class AddColumnToOrderLogs < ActiveRecord::Migration
  def change
    add_column :order_logs, :order_id, :integer
  end
end
