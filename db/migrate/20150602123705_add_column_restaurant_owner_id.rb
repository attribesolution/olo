class AddColumnRestaurantOwnerId < ActiveRecord::Migration
  def change
  	add_column :orders, :restaurant_owner_id, :integer
  end
end
