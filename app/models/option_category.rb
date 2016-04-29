class OptionCategory < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  validates_presence_of :name
end
