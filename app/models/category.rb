class Category < ActiveRecord::Base
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  belongs_to :parent, class_name: "Category"
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_many :menus, dependent: :destroy

  acts_as_nested_set  :before_add     => :do_before_add_stuff,
                      :after_add      => :do_after_add_stuff,
                      :before_remove  => :do_before_remove_stuff,
                      :after_remove   => :do_after_remove_stuff

  mount_uploader :image, CategoryImageUploader

  scope :by_restaurant_owner, lambda{|id| where(restaurant_owner_id: id)}
  scope :parent_only, -> { where( parent_id: 0 ) }
  scope :children_only, ->(parent_id) { where( parent_id: parent_id ) }
  scope :category_dirty, -> {where(dirty: true)}

  validates_presence_of :name

  def active_menus
	  self.menus.is_active
  end

  def dirty_menus
	  self.menus.is_dirty
  end

  # def children
  #   Category.by_restaurant_owner(self.restaurant_owner_id).children_only(self.id)
  # end

  def parent_name
    parent.try(:name)
  end

  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

  private

    def do_before_add_stuff(child_node)
      # do whatever with the child
    end

    def do_after_add_stuff(child_node)
      binding.pry
      # do whatever with the child
    end

    def do_before_remove_stuff(child_node)
      # do whatever with the child
    end

    def do_after_remove_stuff(child_node)
      # do whatever with the child
    end

end


## Ref: https://www.leighhalliday.com/tree-structures-in-your-rails-models