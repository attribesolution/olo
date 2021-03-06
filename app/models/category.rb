class Category < ActiveRecord::Base
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  has_many :menus, dependent: :destroy

  # mount_uploader :image, CategoryImageUploader

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
  scope :parent_only, -> { where( parent_id: 0) }
  scope :category_dirty, -> {where(dirty: true)}

  validates_presence_of :name

  before_validation :set_parent_id, on: [:create, :update]

  def set_parent_id
    if self.parent_id==nil
      self.parent_id=0
    end
  end

  def active_menus
	  self.menus.is_active.order(sort_order: :asc)
  end

  def dirty_menus
	  self.menus.is_dirty
  end
end


## Ref: https://www.leighhalliday.com/tree-structures-in-your-rails-models