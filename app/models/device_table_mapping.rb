class DeviceTableMapping < ActiveRecord::Base
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  validates_uniqueness_of :device_id
  validates_presence_of :device_id, :device_name

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
end
