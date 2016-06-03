class Category < ActiveRecord::Base
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  has_many :menus, dependent: :destroy

  mount_uploader :image, CategoryImageUploader

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
  scope :parent_only, -> { where( parent_id: nil) }
  scope :category_dirty, -> {where(dirty: true)}

  validates_presence_of :name

  def active_menus
	  self.menus.is_active
  end

  def dirty_menus
	  self.menus.is_dirty
  end
end


## Ref: https://www.leighhalliday.com/tree-structures-in-your-rails-models