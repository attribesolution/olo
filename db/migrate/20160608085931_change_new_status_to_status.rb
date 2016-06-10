class ChangeNewStatusToStatus < ActiveRecord::Migration
  def change
  	rename_column :order_logs, :new_status, :status
  end
end
