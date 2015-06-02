class Order < ActiveRecord::Base
  belongs_to :restaurant_table, :class_name => "DeviceTableMapping", :foreign_key => "table_no"
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  has_many :order_details, dependent: :delete_all

  as_enum :status, [:placed, :assigned, :closed], map: :string

  scope :by_user, lambda { |id| where(restaurant_owner_id: id) }

  
end