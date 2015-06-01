class Order < ActiveRecord::Base
  belongs_to :restaurant_table, :class_name => "DeviceTableMapping", :foreign_key => "table_no"
  has_many :order_details, dependent: :delete_all

  as_enum :status, [:placed, :assigned, :closed], map: :string

  
end
