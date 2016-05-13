class AddOrderIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :phone_no, :string
    add_column :answers, :order_id, :integer
  end
end
