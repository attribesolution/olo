class Menu < ActiveRecord::Base
  belongs_to :category
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
end
