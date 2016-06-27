class UuidAddedInOrderDetails < ActiveRecord::Migration
  def change
  	add_column :order_details, :uuid, :string
  end
end
