class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :table_no, null: false

      t.timestamps null: false
    end
  end
end
