class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :email, :string
    add_column :reservations, :branch_id, :integer
  end
end
