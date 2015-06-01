class AddColumnStatusInOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status_cd, :string, null: false, default: "placed"
  end
end
