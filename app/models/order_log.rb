class OrderLog < ActiveRecord::Base
	belongs_to :order
	scope :by_order_id, lambda{|id| where(order_id: id)}
end
