class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :restaurant_owner_id

      t.timestamps null: false
    end
  end
end
