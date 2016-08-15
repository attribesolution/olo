class Reservation < ActiveRecord::Base
	validates_presence_of :time, :no_of_person, :phone
	
	belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
	belongs_to :branch
	scope :by_restaurant, lambda { |id| where(restaurant_owner_id: id) }
	scope :from_reservation, lambda { |id| where("id > ?", id) }
end
