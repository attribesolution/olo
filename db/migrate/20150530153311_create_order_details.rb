class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
    	t.references :order
      t.references :menu
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
