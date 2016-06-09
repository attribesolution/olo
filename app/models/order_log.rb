class OrderLog < ActiveRecord::Base
	belongs_to :order, :foreign_key => "order_id"
	belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
end
