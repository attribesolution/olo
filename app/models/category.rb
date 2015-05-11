class Category < ActiveRecord::Base
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  has_many :menus

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
end
