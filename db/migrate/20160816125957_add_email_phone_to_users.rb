class AddEmailPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notification_email, :string
    add_column :users, :phone, :string
  end
end
