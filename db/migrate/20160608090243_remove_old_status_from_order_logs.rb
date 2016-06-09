class RemoveOldStatusFromOrderLogs < ActiveRecord::Migration
  def change
    remove_column :order_logs, :old_status, :string
  end
end
