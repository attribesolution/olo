class Question < ActiveRecord::Base
	belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
	has_many :answers
end