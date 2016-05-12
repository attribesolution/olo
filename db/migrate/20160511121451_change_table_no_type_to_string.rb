class ChangeTableNoTypeToString < ActiveRecord::Migration
   def change
    change_column :orders, :table_no, :string
  end
end
