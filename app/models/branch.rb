class Branch < ActiveRecord::Base
	belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
	has_many :reservations

	scope :by_restaurant, lambda { |id| where(restaurant_owner_id: id) }
end
