class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :code
      t.string :address
      t.integer :phone

      t.timestamps null: false
    end
  end
end
