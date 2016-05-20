class Order < ActiveRecord::Base
  belongs_to :device_table_mapping
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  has_many :order_details, dependent: :delete_all

  as_enum :status, [:nil, :confirmed, :placed, :prepared, :on_the_way, :delivered], map: :string

  scope :by_restaurant, lambda { |id| where(restaurant_owner_id: id) }
  scope :from_order, lambda { |id| where("id > ?", id) }
end