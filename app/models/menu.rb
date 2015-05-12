class Menu < ActiveRecord::Base
  belongs_to :category
  has_many :menu_images, dependent: :destroy
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
  scope :by_category_id, lambda{|id| where(category_id: id)}
end
