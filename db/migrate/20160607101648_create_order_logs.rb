class CreateOrderLogs < ActiveRecord::Migration
  def change
    create_table :order_logs do |t|
      t.string :old_status
      t.string :new_status
      t.datetime :time

      t.timestamps null: false
    end
  end
end
