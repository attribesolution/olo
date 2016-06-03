class AddUserDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :address, :string
  end
end
