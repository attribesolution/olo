class AddNameToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :item_name, :string
  end
end
