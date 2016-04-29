class Menu < ActiveRecord::Base
  belongs_to :category
  has_many :menu_images, dependent: :destroy
	has_many :option_categories, dependent: :destroy
  accepts_nested_attributes_for :option_categories, reject_if: :all_blank, allow_destroy: true
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
  scope :by_category_id, lambda{|id| where(category_id: id)}
  scope :is_active, -> {where(approved: true)}
  scope :is_dirty, -> {where(dirty: true)}

  validates_presence_of :name, :price, :category, :serving
  validates :price, :numericality => { :greater_than => 0 }
end
