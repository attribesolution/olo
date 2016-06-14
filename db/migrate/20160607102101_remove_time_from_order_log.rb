class RemoveTimeFromOrderLog < ActiveRecord::Migration
  def change
    remove_column :order_logs, :time, :datetime
  end
end
