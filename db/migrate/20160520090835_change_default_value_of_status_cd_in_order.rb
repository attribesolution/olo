class ChangeDefaultValueOfStatusCdInOrder < ActiveRecord::Migration
  def change
  	change_column :orders, :status_cd, :string, null: false, default: "nil"
  end
end
