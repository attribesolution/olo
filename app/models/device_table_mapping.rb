class DeviceTableMapping < ActiveRecord::Base
  validates_uniqueness_of :device_id
  validates_presence_of :device_id, :device_name, :table_number
end
