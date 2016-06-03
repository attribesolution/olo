class RemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :orders, :table_no
  	remove_column :orders, :table_cover
  end
end
