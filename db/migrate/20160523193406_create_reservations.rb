class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :no_of_person
      t.string :phone
      t.integer :restaurant_owner_id

      t.timestamps null: false
    end
  end
end
