class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :phone_no
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
