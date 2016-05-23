class Reservation < ActiveRecord::Base
	scope :by_restaurant, lambda { |id| where(restaurant_owner_id: id) }
end
