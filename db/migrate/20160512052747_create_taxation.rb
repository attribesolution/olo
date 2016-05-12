class CreateTaxation < ActiveRecord::Migration
  def change
    create_table :taxations do |t|
      t.integer :restaurant_owner_id
      t.integer :tax_id
      t.float :percentage
    end
  end
end
